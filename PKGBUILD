# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-jasper
pkgver=4.2.5
pkgrel=1
arch=('any')
pkgdesc="Software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (Android ${_android_arch})"
url='https://www.ece.uvic.ca/~frodo/jasper/'
license=('custom:JasPer2.0')
depends=("android-${_android_arch}-libjpeg")
makedepends=('android-cmake'
             "android-${_android_arch}-libjpeg"
             "android-${_android_arch}-libxmu")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz")
md5sums=('24f32c5f5bd90eb58b1a552d63a29bde')

prepare() {
    cd "${srcdir}/jasper-version-${pkgver}"
    source android-env ${_android_arch}

    sed -r 's|(CMAKE_SKIP_BUILD_RPATH) FALSE|\1 TRUE|g' -i CMakeLists.txt
}

build() {
    cd "${srcdir}/jasper-version-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B ../build-shared \
        -DBUILD_TESTING=OFF \
        -DJAS_ENABLE_OPENGL=OFF \
        -DJAS_ENABLE_LIBJPEG=ON \
        -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DJAS_STDC_VERSION=201112L \
        -DJAS_ENABLE_DOC=OFF \
        -DJAS_ENABLE_PROGRAMS=OFF \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DBUILD_SHARED_LIBS=ON \
        -DJAS_ENABLE_SHARED=ON
    make -C ../build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B ../build-static \
        -DBUILD_TESTING=OFF \
        -DJAS_ENABLE_OPENGL=OFF \
        -DJAS_ENABLE_LIBJPEG=ON \
        -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DJAS_STDC_VERSION=201112L \
        -DJAS_ENABLE_DOC=OFF \
        -DJAS_ENABLE_PROGRAMS=OFF \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.a" \
        -DBUILD_SHARED_LIBS=OFF \
        -DJAS_ENABLE_SHARED=OFF
    make -C ../build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/jasper-version-${pkgver}"
    source android-env ${_android_arch}

    make -C ../build-shared DESTDIR="${pkgdir}" install
    make -C ../build-static DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
