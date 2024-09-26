# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-libtiff
pkgver=4.7.0
pkgrel=1
arch=('any')
pkgdesc="Library for manipulation of TIFF images (Android ${_android_arch})"
url="http://www.simplesystems.org/libtiff/"
license=('custom')
depends=("android-${_android_arch}-jbigkit"
         "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-zstd")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
md5sums=('3a0fa4a270a4a192b08913f88d0cfbdd')

build() {
    cd "${srcdir}/tiff-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -fPIC -fno-strict-aliasing"
    export CXXFLAGS="${CXXFLAGS} -fPIC -fno-strict-aliasing"

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-cxx \
        --disable-tools \
        --disable-tests \
        --disable-docs
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/tiff-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    cp libtiff/{tiffiop,tif_dir}.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    cp libtiff/tif_config.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.a
}
