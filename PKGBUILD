# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Andréas Caumeil <andreas.caumeil@proton.me>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgbase=libopenshot-audio
pkgname=(libopenshot-audio libopenshot-audio-docs)
pkgver=1.0.1
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot"
arch=('x86_64')
url="https://github.com/OpenShot/libopenshot-audio"
license=('GPL-3.0-or-later')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('bbe130caf4929fb36b916d0e2b0cbbf17e8015976f97f78208c6067942adccc74f2e22e2f451efb363abb1563afb2045d196be41dceec6ec8878a130ebe1ce48')
b2sums=('c1d7e4eb5af6a88d3233c142d9cb8248d7853d5c34e08cedda73cc9c275501bc25375feca4a93c17fb6e8495c710560141ccdf1fcbb6972c952db6ec615601c6')

_pick() {
    local p="$1" f d
    shift
    for f; do
        d="${srcdir}/${p}/${f#${pkgdir}/}"
        mkdir -p "$(dirname "${d}")"
        mv "${f}" "${d}"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
    done
}

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}-${pkgver}"
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package_libopenshot-audio() {
    depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++' 'zlib')
    optdepends=('libopenshot-audio-docs: for documentation')
    provides=('libopenshot-audio.so')

    DESTDIR="${pkgdir}" cmake --install build

    cd "${pkgdir}"
    _pick docs usr/share/doc
}

package_libopenshot-audio-docs() {
    pkgdesc+=" (documentation)"

    mv -v docs/* "${pkgdir}"
}
