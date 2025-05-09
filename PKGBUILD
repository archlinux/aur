# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

_android_arch=x86

pkgname=android-${_android_arch}-aom
pkgver=3.12.1
pkgrel=1
arch=('any')
pkgdesc="Alliance for Open Media video codec (Android ${_android_arch})"
url="https://aomedia.org/"
license=('BSD-3-Clause')
depends=('android-ndk')
makedepends=('android-cmake'
             'yasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://storage.googleapis.com/aom-releases/libaom-${pkgver}.tar.gz"{,.asc})
md5sums=('51e4e369c41f66d2f8f1ed83e2206908'
         'SKIP')
validpgpkeys=(
    'B002F08B74A148DAA01F7123A48E86DB0B830498' # AOMedia release signing key <av1-discuss@aomedia.org>
)

build() {
    cd "${srcdir}/libaom-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_SHARED_LIBS=1 \
        -DENABLE_TESTS=OFF \
        -DENABLE_DOCS=OFF \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_TOOLS=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libaom-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
