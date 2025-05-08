# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

_pkgname=bctoolbox
pkgname=bctoolbox-openssl
pkgver=5.4.12
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL-3.0-only)
depends=(gcc-libs openssl)
makedepends=(cmake)
conflicts=("${_pkgname}"
           "${_pkgname}-git")
provides=("${_pkgname}=${pkgver}"
          'libbctoolbox.so=1-64')
source=("https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('1833c0dd2630cadf87686c1f14771cf9c173f6fd04a527f47213de7e0f7d0a7c')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -I${srcdir}/include -Wno-error=unused-parameter" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -I${srcdir}/include" \
    -DENABLE_TESTS_COMPONENT=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_MBEDTLS=OFF \
    -DENABLE_DECAF=OFF \
    -DENABLE_OPENSSL=ON \
    -DDTLS_SRTP_AVAILABLE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
