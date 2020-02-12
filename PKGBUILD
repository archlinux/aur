# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('codablock-bls-signatures')
_pkgname=('bls-signatures')
pkgver=20181101
pkgrel=1
pkgdesc='Chia Networks BLS Signatures implementation fork for Dashcore'
arch=('x86_64')
url='https://github.com/codablock/bls-signatures/'
license=('Apache')
depends=()
makedepends=('git' 'libgmp-static' 'libsodium-static' 'cmake')
source=($pkgname-v$pkgver.tar.gz::https://github.com/codablock/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('35b84b652c356596e9a0c1824eb734b9')

build() {
   cd $_pkgname-$pkgver
   mkdir -p build
   cd build
   cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
   cmake --build . -- -j $(nproc) -Wno-dev
   rm -vr $srcdir/$_pkgname-$pkgver/build/contrib/relic
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
}
