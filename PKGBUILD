pkgname=coacd
pkgver=1.0.12
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
sha256sums=('9357bd6da525127ce538f6f0a3996e33573089848449bd70a2ae0c9bb82966c6')

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

