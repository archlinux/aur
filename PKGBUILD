# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-avisynthplus
pkgver=3.7.3
pkgrel=1
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
        -B build \
        -Wno-dev
    sed -i 's| -lpthread ||g' build/avs_core/avisynth.pc
    sed -i 's| -lpthread ||g' build/avs_core/CMakeFiles/AvsCore.dir/link.txt
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/AviSynthPlus-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}/avisynth"/*.so
}
