# SPDX-FileCopyrightText: 2020 TQ Tezos <https://tqtezos.com/>
#
# SPDX-License-Identifier: LicenseRef-MIT-TQ
FROM alpine:3.12
RUN apk update
RUN apk --no-cache --virtual add rsync git m4 build-base patch unzip \
  bubblewrap wget pkgconfig gmp-dev libev-dev hidapi-dev eudev-dev perl opam libusb-dev bash \
  autoconf automake libtool linux-headers cargo libffi-dev zlib-static
COPY ./build/build-libusb-and-hidapi.sh /build-libusb-and-hidapi.sh
RUN /build-libusb-and-hidapi.sh
COPY ./build/static_libs.patch /static.patch
ARG TEZOS_VERSION
COPY ./build/build-tezos.sh /build-tezos.sh
RUN /build-tezos.sh ${TEZOS_VERSION}
