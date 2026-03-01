# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=perforator
pkgver=0.1.0
pkgrel=1
pkgdesc='Continuous profiling tool designed for large data centers'
arch=('x86_64')
url='https://github.com/yandex/perforator/'
license=('Apache-2.0')
depends=(
    'glibc')
makedepends=(
    'python')
source=("https://github.com/yandex/perforator/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9baaa8570f14cf31f4d26373f6e5befda4f219b5d2a3f9a8e2a260354729118a')

build() {
    cd "${pkgname}-${pkgver}"
    ./ya make \
        --build='release' \
        --build-dir="${srcdir}/build" \
        --clear \
        --gc \
        --gc-symlinks \
        --hardening \
        --link-threads="$(nproc)" \
        --lto \
        --pic \
        --show-extra-progress \
        --stat \
        --threads="$(nproc)" \
        --verbose \
        perforator/bundle
}

package() {
    local _file
    while read -r -d '' _file
    do
        install -D -m755 "${pkgname}-${pkgver}/perforator/bundle/${_file##*/}" "${pkgdir}/usr/bin/perforator-${_file##*/}"
    done < <(find -L "${pkgname}-${pkgver}/perforator/bundle" -type f -executable -print0 | sort -z)
    
    ln -s perforator-cli "${pkgdir}/usr/bin/perforator"
}
