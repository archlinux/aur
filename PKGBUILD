# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon-git
pkgver=1.0.1.r8.gc75bf1b
pkgrel=1
pkgdesc="Trace syscall activity tool"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('glibc' 'clang' 'libedit' 'libelf' 'zlib')
makedepends=('git' 'cmake' 'llvm' 'sqlite')
checkdepends=('iperf3' 'netperf')
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
  make -C "_build"
}

check() {
  cd "ProcMon-for-Linux"

  #make -C "_build" test
}

package() {
  cd "ProcMon-for-Linux"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
