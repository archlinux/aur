# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=perforator-git
pkgver=0.0.7.r2.g4a716a938
pkgrel=1
pkgdesc='Continuous profiling tool designed for large data centers (git version)'
arch=('x86_64')
url='https://github.com/yandex/perforator/'
license=('Apache-2.0')
depends=(
    'glibc')
makedepends=(
    'git'
    'python')
provides=('perforator')
conflicts=('perforator')
source=('git+https://github.com/yandex/perforator.git')
sha256sums=('SKIP')

pkgver() {
    git -C perforator describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd perforator
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
        install -D -m755 "perforator/perforator/bundle/${_file##*/}" "${pkgdir}/usr/bin/perforator-${_file##*/}"
    done < <(find -L perforator/perforator/bundle -type f -executable -print0 | sort -z)
    
    ln -s perforator-cli "${pkgdir}/usr/bin/perforator"
}
