# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-jemalloc
pkgver=5.3.0
pkgrel=2
pkgdesc="General-purpose scalable concurrent malloc implementation (Android ${_android_arch})"
arch=('any')
license=('BSD')
url='http://www.canonware.com/jemalloc/'
groups=('android-jemalloc')
depends=('android-ndk')
makedepends=('android-configure')
optdepends=('perl: for jeprof')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/jemalloc-${pkgver}.tar.bz2")
md5sums=('09a8328574dab22a7df848eae6dbbf53')

build() {
    cd "${srcdir}/jemalloc-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-prof \
        --enable-autogen \
        --with-jemalloc-prefix=je_
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/jemalloc-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
