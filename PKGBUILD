# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon-git
pkgver=2.1.0.0.r0.gc5f8271
pkgrel=4
pkgdesc="Trace syscall activity tool"
arch=('x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('gcc-libs' 'libedit' 'libelf' 'ncurses' 'sysinternalsebpf' 'zlib' 'zstd')
makedepends=('git' 'cmake' 'clang' 'sqlite')
provides=("procmon=$pkgver")
conflicts=('procmon')
source=("git+https://github.com/microsoft/ProcMon-for-Linux.git")
sha256sums=('SKIP')


pkgver() {
  cd "ProcMon-for-Linux"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ProcMon-for-Linux"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "ProcMon-for-Linux"

  #cmake --build "_build" --target test
}

package() {
  cd "ProcMon-for-Linux"

  install -Dm755 "_build"/{getsyscalls,procmon} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
