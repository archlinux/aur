# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-json-c
pkgver=0.17
_pkgverdate=20230812
pkgrel=1
arch=('any')
pkgdesc="A JSON implementation in C (Android ${_android_arch})"
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/json-c/json-c/archive/refs/tags/json-c-${pkgver}-${_pkgverdate}.tar.gz")
md5sums=('6d724389b0a08c519d9dd6e2fac7efb8')

build() {
    cd "${srcdir}/json-c-json-c-${pkgver}-${_pkgverdate}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -DBUILD_STATIC_LIBS=ON \
        -DENABLE_THREADING=ON \
        -DENABLE_RDRAND=OFF \
        .
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/json-c-json-c-${pkgver}-${_pkgverdate}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
