# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-svt-av1
pkgver=2.0.0
pkgrel=1
arch=('any')
pkgdesc="Scalable Video Technology AV1 encoder and decoder (Android ${_android_arch})"
url='https://gitlab.com/AOMediaCodec/SVT-AV1'
license=('BSD'
         'custom: Alliance for Open Media Patent License 1.0')
depends=('android-ndk')
makedepends=('android-cmake'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${pkgver}/SVT-AV1-v${pkgver}.tar.bz2")
md5sums=('c2997034a5bff3eec4c885adf27e152f')

prepare() {
    cd "${srcdir}/SVT-AV1-v$pkgver"
    sed -i '/CMAKE_BUILD_TYPE Release/d' CMakeLists.txt
}

build() {
    cd "${srcdir}/SVT-AV1-v$pkgver"
    source android-env ${_android_arch}

    export LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"
    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_APPS=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DNATIVE=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/SVT-AV1-v$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
