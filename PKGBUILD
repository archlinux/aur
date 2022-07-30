# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_android_arch=x86

pkgname=android-${_android_arch}-libtiff
pkgver=4.4.0
pkgrel=1
pkgdesc="Library for manipulation of TIFF images (android)"
arch=('any')
url="http://www.simplesystems.org/libtiff/"
license=('custom')
depends=("android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-xz")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
md5sums=('376f17f189e9d02280dfe709b2b2bbea')

build() {
    cd "${srcdir}/tiff-${pkgver}"
    source android-env ${_android_arch}
    export CFLAGS="-fno-strict-aliasing"
    export CXXFLAGS="-fno-strict-aliasing"

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
