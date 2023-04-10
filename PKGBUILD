# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-git
pkgver=1.19.0.r23.gd43e322c
pkgrel=1
pkgdesc="Intel SPMD program compiler"
arch=('i686' 'x86_64')
url="https://ispc.github.io/"
license=('BSD')
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
  make -C "_build"
}

check() {
  cd "ispc"

  #make -C "_build" check-all
}

package() {
  cd "ispc"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "contrib/ispc.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/ispc"
}
