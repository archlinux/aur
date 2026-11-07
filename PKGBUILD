# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf-git
pkgver=2.3.0.r0.ga43369a
pkgrel=1
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'glib2' 'json-glib' 'libelf' 'libz.so')
makedepends=('git' 'clang' 'cmake' 'zlib')
provides=("sysinternalsebpf=$pkgver")
conflicts=('sysinternalsebpf')
source=("git+https://github.com/microsoft/SysinternalsEBPF.git")
sha256sums=('SKIP')


prepare() {
  cd "SysinternalsEBPF"

  sed -i 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION/;s/-Werror//' "CMakeLists.txt"
}

pkgver() {
  cd "SysinternalsEBPF"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "SysinternalsEBPF"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "SysinternalsEBPF"

  #cmake --build "_build" --target test
}

package() {
  cd "SysinternalsEBPF"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sysinternalsebpf"
}
