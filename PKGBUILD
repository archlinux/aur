# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: farid abdelnour <farid at atelier-labs.org>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-twolame
pkgver=0.4.0
pkgrel=2
pkgdesc="An optimized MPEG Audio Layer 2 (MP2) encoder (Android ${_android_arch})"
arch=('any')
url="http://www.twolame.org/"
license=('LGPL2.1')
depends=("android-${_android_arch}-libsndfile")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/njh/twolame/releases/download/${pkgver}/twolame-${pkgver}.tar.gz")
md5sums=('400c164ed096c7aea82bcf8edcd3f6f9')

prepare() {
    cd "${srcdir}/twolame-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/twolame-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/twolame-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
