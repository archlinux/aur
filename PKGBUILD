# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf
pkgver=1.6.0
pkgrel=1
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'json-glib' 'libelf' 'zstd')
makedepends=('clang' 'cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/microsoft/SysinternalsEBPF/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f5a33a697d1a77a7f9205218f58c6c0eec8099f62d3ea9875f9f5ce2dd263070')


prepare() {
  cd "SysinternalsEBPF-$pkgver"

  sed -i 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION/;s/-Werror//' "CMakeLists.txt"
}

build() {
  cd "SysinternalsEBPF-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "SysinternalsEBPF-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "SysinternalsEBPF-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sysinternalsebpf"
}
