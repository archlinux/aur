# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('dashpay-bls-signatures')
_pkgname=('bls-signatures')
pkgver=1.3.1
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/dashpay/bls-signatures/'
license=('Apache')
depends=()
conflicts=('codablock-bls-signatures')
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake' 'catch2')
source=($pkgname-v$pkgver.tar.gz::https://github.com/dashpay/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('fd3a741185d87c8e40f3744e41ae75922924630fe33808ea3ddb0fb68895b6c5c0078673751c3c3f360755b866218c91c41bcfd1ddf00b780fc065706fc3c575')

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
