pkgname=coacd
pkgver=1.0.13
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
sha256sums=('0e9e875fc55e6e399d4691cc4a47e36d0f64d076937de6f78bc7c4aa28bb472b')

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

