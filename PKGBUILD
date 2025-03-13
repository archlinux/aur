# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-devil
pkgver=1.8.0
pkgrel=4
arch=('any')
pkgdesc="Library for reading several different image formats (Android ${_android_arch})"
url="https://sourceforge.net/projects/openil/"
license=('GPL')
groups=('android-devil')
depends=("android-${_android_arch}-libpng"
         "android-${_android_arch}-jasper"
         "android-${_android_arch}-lcms2"
         "android-${_android_arch}-libjpeg-turbo")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/openil/DevIL-${pkgver}.tar.gz"
        'jasper.patch')
md5sums=('4d8c21aa4822ac86d77e44f8d7c9becd'
         '750c53a2c9ce49b61ffb075066d07f21')

prepare() {
    cd "${srcdir}/DevIL"

    # https://github.com/DentonW/DevIL/commit/42a62648e727e9a0217280474546de3ac69cbff1
    patch -Np1 -i ../jasper.patch

    sed -i 's| SHARED | |g' DevIL/src-IL/CMakeLists.txt
    sed -i 's| SHARED | |g' DevIL/src-ILU/CMakeLists.txt
    sed -i 's| SHARED | |g' DevIL/src-ILUT/CMakeLists.txt
    sed -i 's|register ||g' DevIL/src-IL/src/il_manip.cpp
}

build() {
    cd "${srcdir}/DevIL/DevIL"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libpng" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.so" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.so" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DJASPER_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJASPER_LIBRARIES="${ANDROID_PREFIX_LIB}/libjasper.so" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.so"
    make -C build-shared $MAKEFLAGS

    export LDFLAGS="${LDFLAGS} -ljbig -ldeflate -llzma -lwebp -lzstd"

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libpng" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.a" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.a" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.a" \
        -DJASPER_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJASPER_LIBRARIES="${ANDROID_PREFIX_LIB}/libjasper.a" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.a"
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/DevIL/DevIL"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
