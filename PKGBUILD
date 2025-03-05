# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-svt-av1
pkgver=2.3.0
pkgrel=1
arch=('any')
pkgdesc="Scalable Video Technology AV1 encoder and decoder (Android ${_android_arch})"
url='https://gitlab.com/AOMediaCodec/SVT-AV1'
license=('BSD'
         'custom: Alliance for Open Media Patent License 1.0')
groups=('android-svt-av1')
depends=('android-ndk')
makedepends=('android-cmake'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${pkgver}/SVT-AV1-v${pkgver}.tar.bz2")
md5sums=('a86cac2227942f6d8e17ca1fdcac1627')

prepare() {
    cd "${srcdir}/SVT-AV1-v${pkgver}"

    sed -i '/CMAKE_BUILD_TYPE Release/d' CMakeLists.txt
}

build() {
    cd "${srcdir}/SVT-AV1-v${pkgver}"
    source android-env ${_android_arch}

    export LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_APPS=OFF \
        -DNATIVE=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_APPS=OFF \
        -DNATIVE=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/SVT-AV1-v${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
