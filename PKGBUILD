# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-json-c
pkgver=0.18
_pkgverdate=20240915
pkgrel=1
arch=('any')
pkgdesc="A JSON implementation in C (Android ${_android_arch})"
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/json-c/json-c/archive/refs/tags/json-c-${pkgver}-${_pkgverdate}.tar.gz")
md5sums=('97f1a79151cae859983afbc46b40b92c')

build() {
    cd "${srcdir}/json-c-json-c-${pkgver}-${_pkgverdate}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_STATIC_LIBS=ON \
        -DENABLE_THREADING=ON \
        -DENABLE_RDRAND=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/json-c-json-c-${pkgver}-${_pkgverdate}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
