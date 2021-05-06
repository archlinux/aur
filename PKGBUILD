# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon-git
pkgver=r21.gb35d4cc
pkgrel=1
pkgdesc="Trace syscall activity tool"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('glibc' 'clang' 'libedit' 'libelf' 'zlib')
makedepends=('git' 'cmake' 'llvm' 'sqlite')
checkdepends=('iperf3' 'netperf')
provides=('procmon')
conflicts=('procmon')
source=("git+https://github.com/microsoft/ProcMon-for-Linux.git")
sha256sums=('SKIP')


pkgver() {
  cd "ProcMon-for-Linux"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
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
