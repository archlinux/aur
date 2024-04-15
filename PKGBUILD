# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-openexr
pkgver=3.2.4
pkgrel=1
arch=('any')
pkgdesc="A high dynamic-range image file format library (Android ${_android_arch})"
url='https://www.openexr.com/'
license=('BSD-3-Clause')
depends=("android-${_android_arch}-imath"
         "android-${_android_arch}-libdeflate")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/openexr/openexr/archive/v$pkgver/openexr-$pkgver.tar.gz")
sha256sums=('81e6518f2c4656fdeaf18a018f135e96a96e7f66dbe1c1f05860dd94772176cc')

build() {
    cd "${srcdir}/openexr-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DOPENEXR_TEST_LIBRARIES=OFF \
        -DOPENEXR_TEST_PYTHON=OFF \
        -DOPENEXR_TEST_TOOLS=OFF \
        -DOPENEXR_BUILD_EXAMPLES=OFF \
        -DOPENEXR_BUILD_TOOLS=OFF \
        -DImath_DIR="${ANDROID_PREFIX_LIB}/cmake/Imath" \
        -Dlibdeflate_DIR="${ANDROID_PREFIX_LIB}/cmake/libdeflate"
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/openexr-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
