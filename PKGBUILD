# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Chaiwat Suttipongsakul <cwt114@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libdatrie
pkgver=0.2.14
pkgrel=1
arch=('any')
pkgdesc="Double-array trie library (Android ${_android_arch})"
url='https://linux.thai.net/projects/datrie'
license=('LGPL-2.1-or-later')
groups=('android-libdatrie')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-${pkgver}.tar.xz")
md5sums=('338d7b0c3e70967fc62d8f52e8bffe0b')

build() {
    cd "${srcdir}/libdatrie-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doxygen-doc
    make -C datrie $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdatrie-${pkgver}"
    source android-env ${_android_arch}

    make -C datrie DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install-pkgconfigDATA
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
