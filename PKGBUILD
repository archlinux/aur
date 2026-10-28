# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-c
pkgver=1.10.2
pkgrel=1
pkgdesc="C API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ninja' 'rust')
source=("https://github.com/eclipse-zenoh/zenoh-c/archive/$pkgver.tar.gz")
sha256sums=('766bd6220749c6743bf3715af74afdf5ae129525fac9b3a372b74070fe1704d4')

_builddir="build-${pkgver}"

options=(!debug)

build() {
  # Discussion on LTO: https://github.com/briansmith/ring/issues/1444
  CFLAGS+=' -fno-lto'
  CXXFLAGS+=' -fno-lto'

  cmake -GNinja -B "${_builddir}" -S "$pkgname-$pkgver" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHC_BUILD_WITH_UNSTABLE_API:BOOL=ON \
           -DZENOHC_BUILD_WITH_SHARED_MEMORY:BOOL=ON
  cmake --build "${_builddir}"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${_builddir}"
}
