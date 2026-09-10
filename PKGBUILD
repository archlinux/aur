# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf
pkgver=2.2.2
pkgrel=1
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'json-glib' 'libelf' 'zstd')
makedepends=('clang' 'cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/microsoft/SysinternalsEBPF/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba4ff8afccba126966366ad809d7975c215eacc40c2e42cc1fd14efc5cd04269')


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
