# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-avisynthplus
pkgver=3.7.3
pkgrel=2
arch=('any')
pkgdesc="An improved version of the AviSynth frameserver (Android ${_android_arch})"
url='https://avs-plus.net/'
license=('GPL')
depends=('android-ndk')
optdepends=("android-${_android_arch}-devil: for ImageSeq plugin")
makedepends=('android-cmake'
             "android-${_android_arch}-devil")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}/avisynthplus-${pkgver}.tar.gz")
sha256sums=('b847705af6f16fa26664d06e0fea2bda14a7f6aac8249a9c37e4106ecb8fd44c')

build() {
    cd "${srcdir}/AviSynthPlus-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DIL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/IL" \
        -DIL_LIBRARIES="${ANDROID_PREFIX_LIB}/libIL.so" \
        -DILU_LIBRARIES="${ANDROID_PREFIX_LIB}/libILU.so" \
        -Wno-dev
    sed -i 's| -lpthread ||g' build-shared/avs_core/avisynth.pc
    sed -i 's| -lpthread ||g' build-shared/avs_core/CMakeFiles/AvsCore.dir/link.txt
    make -C build-shared $MAKEFLAGS

    export LDFLAGS="${LDFLAGS} -ljasper -ljpeg -lpng -ltiff"

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DIL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/IL" \
        -DIL_LIBRARIES="${ANDROID_PREFIX_LIB}/libIL.a" \
        -DILU_LIBRARIES="${ANDROID_PREFIX_LIB}/libILU.a" \
        -Wno-dev
    sed -i 's| -lpthread ||g' build-static/avs_core/avisynth.pc
    sed -i 's| -lpthread ||g' build-static/avs_core/CMakeFiles/AvsCore.dir/link.txt
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/AviSynthPlus-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="$pkgdir" install
    make -C build-static DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}/avisynth"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
