# Maintainer: kutu OS contributors <release@kutu.so>

pkgname=libmempressure
pkgver=0.2.1
pkgrel=1
pkgdesc='Memory-pressure events from kernel PSI for applications, an onTrimMemory for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/kutuso/libmempressure'
license=('MIT')
depends=('glibc')
makedepends=('cmake')
checkdepends=('binutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4772859a141dc81e989790227ba4265a49d6cb030c1f278381ee6e6e7b1facf1')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMP_PYTHON=OFF \
    -DMP_JAVA=OFF \
    -DMP_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
