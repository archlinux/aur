# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-cmocka
pkgver=1.1.7
pkgrel=1
arch=('any')
pkgdesc="Elegant unit testing framework for C with support for mock objects (Android ${_android_arch})"
url='https://cmocka.org/'
license=('Apache')
depends=('android-ndk')
makedepends=('android-cmake')
source=("https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz"{,.asc})
options=(!strip !buildflags staticlibs !emptydirs)
md5sums=('dc23f4870eb7dfa6da065f3056e815b0'
         'SKIP')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>

build() {
    cd "${srcdir}/cmocka-$pkgver"
    source android-env ${_android_arch}

    mkdir -p build && pushd build
    android-${_android_arch}-cmake \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DBUILD_STATIC_LIB=TRUE \
      -DWITH_STATIC_LIB=TRUE \
      -DUNIT_TESTING=OFF \
      ..
    make $MAKEFLAGS
    popd
}

package() {
    cd "${srcdir}/cmocka-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
