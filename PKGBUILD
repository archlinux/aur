# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-highway
pkgver=1.2.0
pkgrel=1
arch=('any')
pkgdesc="A C++ library that provides portable SIMD/vector intrinsics (Android ${_android_arch})"
url='https://github.com/google/highway/'
license=('Apache-2.0'
         'BSD-3-Clause')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/google/highway/archive/${pkgver}/highway-${pkgver}.tar.gz")
sha256sums=('7e0be78b8318e8bdbf6fa545d2ecb4c90f947df03f7aadc42c1967f019e63343')

build() {
    cd "${srcdir}/highway-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -Wno-dev \
        -DBUILD_TESTING=OFF \
        -DHWY_ENABLE_EXAMPLES=OFF \
        -DHWY_ENABLE_TESTS=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/highway-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
