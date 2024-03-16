# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-libtiff
pkgver=4.6.0
pkgrel=2
pkgdesc="Library for manipulation of TIFF images (Android, ${_android_arch})"
arch=('any')
url="http://www.simplesystems.org/libtiff/"
license=('custom')
depends=("android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-xz")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
md5sums=('fc7d49a9348b890b29f91a4ecadd5b49')

build() {
    cd "${srcdir}/tiff-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -fno-strict-aliasing"
    export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"

    android-${_android_arch}-configure \
        --disable-jbig \
        --without-x
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/tiff-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    cp libtiff/{tiffiop,tif_dir}.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    cp libtiff/tif_config.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
