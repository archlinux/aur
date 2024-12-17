# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('dashpay-bls-signatures')
_pkgname=('bls-signatures')
pkgver=1.3.4
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/dashpay/bls-signatures/'
license=('Apache')
depends=()
conflicts=('codablock-bls-signatures')
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake' 'catch2')
source=($pkgname-v$pkgver.tar.gz::https://github.com/dashpay/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('716a610674ca9e8229e1704027841bf5ab4c59b989c4eee6c23423f28321a3681b9f730b6485ee8a18401a98b574c9de38c89da25f865a1a70ef4e20763e8365')

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
