# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('dashpay-bls-signatures')
_pkgname=('bls-signatures')
pkgver=1.2.4
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/dashpay/bls-signatures/'
license=('Apache')
depends=()
conflicts=('codablock-bls-signatures')
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake' 'catch2')
source=($pkgname-v$pkgver.tar.gz::https://github.com/dashpay/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('0acb1693869ccb9e451a9dc1fc6f52b4785f85f3df0e30075d0e6869a8cb4973987007560b25e3402caa65f94bfc577ab66be7333a82082524e5aafb6d210fc3')

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
