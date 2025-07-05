# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libjpeg-turbo
pkgver=3.1.1
pkgrel=1
arch=('any')
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (Android ${_android_arch})"
license=("custom")
url="http://libjpeg-turbo.virtualgl.org"
groups=('android-libjpeg-turbo'
        'android-libjpeg')
depends=('android-ndk')
makedepends=('android-cmake'
             'yasm')
provides=("android-${_android_arch}-libjpeg")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/$pkgver.tar.gz")
md5sums=('4cc83d985db61e64bfa352388bb447ec')

build() {
    cd "${srcdir}/libjpeg-turbo-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DWITH_JPEG8=ON
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libjpeg-turbo-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
