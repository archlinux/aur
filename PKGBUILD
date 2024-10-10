# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('dashpay-bls-signatures')
_pkgname=('bls-signatures')
pkgver=1.3.3
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/dashpay/bls-signatures/'
license=('Apache')
depends=()
conflicts=('codablock-bls-signatures')
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake' 'catch2')
source=($pkgname-v$pkgver.tar.gz::https://github.com/dashpay/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('dc3913a30b81321bb2db3652db4d2dde6fb969e4c41d535b663bf2d2fbf832124a6d7619b84ceacb3771697efddaec121ee0b8a9e6d828bc6a48bc53aa62acce')

build() {
   cd $_pkgname-$pkgver
   mkdir -p build
   cd build
   cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
   cmake --build . -- -Wno-dev
}

check() {
   cd $_pkgname-$pkgver
   ./build/src/runtest
}

package() {
   cd $_pkgname-$pkgver
   cd build
   make DESTDIR="${pkgdir}" install
   cd ..
   install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   #remove everything that is not needed to compile dashcore
   rm -rv $pkgdir/usr/cmake
   rm -rv $pkgdir/usr/include/relic
   rm -rv $pkgdir/usr/lib/librelic_s.a
}
