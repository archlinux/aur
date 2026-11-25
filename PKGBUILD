#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]tsickert.com) 16.12.2012

# License
# -------

# This library written by Torben Sickert stands under a creative commons naming
# 4.0 international license.
# See https://creativecommons.org/licenses/by/4.0/deed.de
# endregion
pkgname=certbot-proxy
pkgver=4.0.0
pkgrel=1
pkgdesc='generic dockerized nginx proxy server with certbot'
arch=(any)
url=https://tsickert.com/certbot-proxy
license=(CC-BY-4.0)
depends=(bash docker docker-compose)
backup=(
    srv/http/service/certbot-proxy/etc/nginx/00_default.conf
    srv/http/service/certbot-proxy/etc/nginx/helper/certificate.include
    srv/http/service/certbot-proxy/etc/nginx/helper/ssl.include
)
# NOTE: Only the service files are needed, the image is pulled from the
# registry.
source=("https://github.com/thaibault/certbot-proxy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a3bf4b38353ae397aeb75dba703b9cc11e1f2358ac6367d34a6b0aa6023cd54')
copy_to_aur=true

package() {
    cd "${srcdir}/certbot-proxy-${pkgver}"
    # NOTE: "certbot-proxy.service" runs the compose files from here and they
    # mount the configuration and certificate folders relative to themselves.
    local -r target_path="${pkgdir}/srv/http/service/certbot-proxy/"
    local file_path
    for file_path in \
        etc/nginx/00_default.conf \
        etc/nginx/helper/certificate.include \
        etc/nginx/helper/ssl.include \
        service/docker/*.yaml \
        service/kubernetes/*.yaml
    do
        install -D --mode 644 "$file_path" "${target_path}${file_path}"
    done
    install -d \
        "${target_path}certificates/acme-challenge" \
        "${target_path}etc/containerBase"
    for file_path in service/systemd/*; do
        install \
            -D \
            --mode 644 \
            "$file_path" \
            "${pkgdir}/usr/lib/systemd/system/$(basename "$file_path")"
    done
}
