# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-jemalloc
pkgver=5.3.0
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation (android)'
arch=('any')
license=('BSD')
url='http://www.canonware.com/jemalloc/'
depends=('android-ndk')
makedepends=('android-configure')
optdepends=('perl: for jeprof')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/jemalloc-${pkgver}.tar.bz2")
sha256sums=('2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa')

build() {
    cd "${srcdir}/jemalloc-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-prof \
        --enable-autogen \
        --with-jemalloc-prefix=je_
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/jemalloc-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
