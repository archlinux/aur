# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-imath
pkgver=3.1.11
pkgrel=2
pkgdesc="A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics (Android ${_android_arch})"
arch=('any')
url='https://www.openexr.com/'
license=('BSD-3-Clause')
groups=(android-imath)
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-boost")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/AcademySoftwareFoundation/Imath/archive/v${pkgver}/imath-${pkgver}.tar.gz")
sha256sums=('9057849585e49b8b85abe7cc1e76e22963b01bfdc3b6d83eac90c499cd760063')

build() {
    cd "${srcdir}/Imath-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF
    cmake --build build-shared

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF
    cmake --build build-static
}

package() {
    cd "${srcdir}/Imath-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
