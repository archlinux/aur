# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-git
pkgver=1.26.0.r420.g1f8ac39a
pkgrel=1
pkgdesc="Intel SPMD program compiler"
arch=('i686' 'x86_64')
url="https://ispc.github.io/"
license=('BSD-3-Clause')
depends=('clang' 'llvm-libs' 'zlib')
makedepends=('git' 'cmake' 'lib32-glibc' 'llvm' 'python')
provides=("ispc=$pkgver")
conflicts=('ispc')
source=("git+https://github.com/ispc/ispc.git")
sha256sums=('SKIP')


pkgver() {
  cd "ispc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ispc"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DISPC_INCLUDE_EXAMPLES=OFF \
    -DISPC_NO_DUMPS=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "ispc"

  #cmake --build "_build" --target check-all
}

package() {
  cd "ispc"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "contrib/ispc.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/ispc"
}
