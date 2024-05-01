# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-verdict
pkgver=1.4.2
pkgrel=1
arch=('any')
pkgdesc="Compute quality functions of 2 and 3-dimensional regions (Android ${_android_arch})"
url='https://github.com/sandialabs/verdict'
license=('BSD')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/sandialabs/verdict/archive/$pkgver/verdict-$pkgver.tar.gz")
sha256sums=('225c8c5318f4b02e7215cefa61b5dc3f99e05147ad3fefe6ee5a3ee5b828964b')

build() {
    cd "${srcdir}/verdict-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DVERDICT_ENABLE_TESTING=OFF
    make -C build $MAKEFLAGS
}

package () {
    cd "${srcdir}/verdict-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
