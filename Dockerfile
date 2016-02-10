FROM alpine

RUN apk add --no-cache python3 && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    wget "https://bootstrap.pypa.io/get-pip.py" -O /dev/stdout | python3 && \
    apk del build-dependencies

COPY . /app
WORKDIR /app
RUN python3 setup.py install
WORKDIR /
RUN rm -rf /app
