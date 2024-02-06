# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-libjpeg-turbo
pkgver=3.0.2
pkgrel=1
arch=('any')
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (android)"
license=("custom")
url="http://libjpeg-turbo.virtualgl.org"
depends=('android-ndk')
groups=(android-libjpeg-turbo)
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake' 'yasm')
source=("https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/$pkgver.tar.gz")
md5sums=('94756db95bc2477f7f7dad1c2590b51f')

build() {
    cd "${srcdir}"/libjpeg-turbo-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -DWITH_JPEG8=ON \
        .
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libjpeg-turbo-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
