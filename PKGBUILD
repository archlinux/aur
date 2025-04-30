# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.4.12
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL-3.0-only)
depends=(gcc-libs libdecaf mbedtls)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2
    config.patch
)
sha256sums=('1833c0dd2630cadf87686c1f14771cf9c173f6fd04a527f47213de7e0f7d0a7c'
            'ce74b1480fbc49654852b3fd661de396dabe911ea7552ada3858048e4660963f')

prepare() {
    mkdir -p include
    patch /usr/include/mbedtls/mbedtls_config.h config.patch -o include/myconfig.h
    echo "typedef void* mbedtls_threading_mutex_t;" > include/threading_alt.h
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -I${srcdir}/include -Wno-error=unused-parameter -DMBEDTLS_CONFIG_FILE='<myconfig.h>'" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -I${srcdir}/include -DMBEDTLS_CONFIG_FILE='<myconfig.h>'" \
    -DENABLE_TESTS_COMPONENT=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_DECAF=ON \
    -DDTLS_SRTP_AVAILABLE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
