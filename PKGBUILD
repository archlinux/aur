# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf
pkgver=2.3.0
pkgrel=2
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'glib2' 'json-glib' 'libelf' 'libz.so')
makedepends=('git' 'clang' 'cmake' 'zlib')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/microsoft/SysinternalsEBPF/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0b7e37c45fa9742088b9cd3ecd56376c4547cfd5dd4b2e6be0245e1bb4a145aa')


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
