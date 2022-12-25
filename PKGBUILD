# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('dashpay-bls-signatures')
_pkgname=('bls-signatures')
pkgver=1.2.5
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/dashpay/bls-signatures/'
license=('Apache')
depends=()
conflicts=('codablock-bls-signatures')
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake' 'catch2')
source=($pkgname-v$pkgver.tar.gz::https://github.com/dashpay/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b60d843e931b0770adf7569d296b77a117cfe0986fe942eb713f1a5a752d7c6e393d0a90b2a6e21a02d66e1701980f6d4f7b351d467b07551acf36573c65dac7')

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
