pkgname=coacd
pkgver=1.0.9
pkgrel=1
pkgdesc="Approximate Convex Decomposition for 3D Meshes"
license=('MIT')
arch=('x86_64')
url="https://colin97.github.io/CoACD/"
depends=(glibc libstdc++ libgomp libgcc)
makedepends=(cmake cdt)
options=(!lto)
source=("https://github.com/SarahWeiii/CoACD/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cb805bc667eaebb0e5444ad5248d14a1d79d8b982c1d40991e03aa0871f0aaf1')

prepare () {
  cd CoACD-$pkgver
  # clip.cpp:3:10: fatal error: include/CDTUtils.h: No such file or directory
  curl -L https://github.com/SarahWeiii/CoACD/pull/95.patch | patch -p1
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
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/CoACD-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname
}

