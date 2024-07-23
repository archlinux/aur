# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf-git
pkgver=1.4.0.0.r0.gf8c8bd2
pkgrel=2
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/Sysinternals/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libelf' 'zstd')
makedepends=('git' 'clang' 'cmake')
provides=("sysinternalsebpf=$pkgver")
conflicts=('sysinternalsebpf')
options=('staticlibs')
source=("git+https://github.com/Sysinternals/SysinternalsEBPF.git")
sha256sums=('SKIP')


pkgver() {
  cd "SysinternalsEBPF"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
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
