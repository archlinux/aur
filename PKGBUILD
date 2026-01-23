# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-openexr
pkgver=3.4.4
pkgrel=1
arch=('any')
pkgdesc="A high dynamic-range image file format library (Android ${_android_arch})"
url='https://www.openexr.com/'
license=('BSD-3-Clause')
groups=('android-openexr')
depends=("android-${_android_arch}-imath"
         "android-${_android_arch}-libdeflate"
         "android-${_android_arch}-openjph")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/openexr/openexr/archive/v${pkgver}/openexr-${pkgver}.tar.gz")
md5sums=('ad8587c4a64bf423c387734e85d17432')

build() {
    cd "${srcdir}/openexr-${pkgver}"
    source android-env ${_android_arch}

    if [[ "${_android_arch}" == armv7a-eabi ||  "${_android_arch}" == x86 ]]; then
        export CFLAGS="${CFLAGS} -D_LIBCPP_HAS_NO_OFF_T_FUNCTIONS"
        export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_HAS_NO_OFF_T_FUNCTIONS"
    fi

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DOPENEXR_TEST_LIBRARIES=OFF \
        -DOPENEXR_TEST_PYTHON=OFF \
        -DOPENEXR_TEST_TOOLS=OFF \
        -DOPENEXR_BUILD_EXAMPLES=OFF \
        -DOPENEXR_BUILD_TOOLS=OFF \
        -DImath_DIR="${ANDROID_PREFIX_LIB}/cmake/Imath" \
        -Dlibdeflate_DIR="${ANDROID_PREFIX_LIB}/cmake/libdeflate" \
        -Dopenjph_DIR="${ANDROID_PREFIX_LIB}/cmake/openjph"
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DOPENEXR_TEST_LIBRARIES=OFF \
        -DOPENEXR_TEST_PYTHON=OFF \
        -DOPENEXR_TEST_TOOLS=OFF \
        -DOPENEXR_BUILD_EXAMPLES=OFF \
        -DOPENEXR_BUILD_TOOLS=OFF \
        -DImath_DIR="${ANDROID_PREFIX_LIB}/cmake/Imath" \
        -Dlibdeflate_DIR="${ANDROID_PREFIX_LIB}/cmake/libdeflate" \
        -Dopenjph_DIR="${ANDROID_PREFIX_LIB}/cmake/openjph"
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/openexr-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
