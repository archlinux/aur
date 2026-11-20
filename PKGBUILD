# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vvdec
pkgver=3.3.0
pkgrel=1
pkgdesc="Fraunhofer versatile video decoder"
arch=('i686' 'x86_64')
url="https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc/fraunhofer-versatile-video-decoder-vvdec.html"
license=('BSD-3-Clause-Clear')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
provides=('libvvdec.so')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/fraunhoferhhi/vvdec/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b09dbd3e3ea76972a6a2fb59e96b81a9c953f414e69f8a1b5a23eeca5bc2600')


build() {
  cd "$pkgname-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/vvdec"
}
