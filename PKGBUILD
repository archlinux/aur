# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf
pkgver=1.5
pkgrel=2
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'json-glib' 'libelf' 'zstd')
makedepends=('clang' 'cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/microsoft/SysinternalsEBPF/archive/refs/tags/$pkgver.0.0.tar.gz")
sha256sums=('46fb5cab794d10e40a6b6f6ab53ddcda678c1c7667fcca6e100a429b6f2314f5')


prepare() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  sed -i 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION/;s/-Werror//' "CMakeLists.txt"
}

build() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  #cmake --build "_build" --target test
}

package() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sysinternalsebpf"
}
