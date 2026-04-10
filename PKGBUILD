pkgname=coacd
pkgver=1.0.10
pkgrel=1
pkgdesc="Approximate Convex Decomposition for 3D Meshes"
license=('MIT')
arch=('x86_64')
url="https://colin97.github.io/CoACD/"
depends=(glibc libstdc++ libgomp libgcc)
optdepends=('python-trimesh: for Python bindings')
makedepends=(cmake cdt)
options=(!lto)
source=("https://github.com/SarahWeiii/CoACD/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e43873d3ebe647cb720ce28d5167c888ff5401c4c8c38666bee25cf7f04abe40')

prepare () {
  cd CoACD-$pkgver
}

build() {
  cd CoACD-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_3RD_PARTY_LIBS=OFF \
        -B build .
  cmake --build build
}

package() {
  cd CoACD-$pkgver
  DESTDIR="$pkgdir" cmake --build build --target install
  install -d "$pkgdir"/usr/lib/python3.14/site-packages/coacd
  install -m644 python/package/__init__.py "$pkgdir"/usr/lib/python3.14/site-packages/coacd
  ln -s ../../../lib_coacd.so "$pkgdir"/usr/lib/python3.14/site-packages/coacd/lib_coacd.so
  install -d "$pkgdir"/usr/bin
  install -m755 python/package/bin/coacd "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

