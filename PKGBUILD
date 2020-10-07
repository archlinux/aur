# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-git
pkgver=1.14.1.r15.gc4529a3c
pkgrel=2
pkgdesc="Intel SPMD program compiler"
arch=('i686' 'x86_64')
url="https://ispc.github.io/"
license=('BSD')
depends=('clang' 'llvm-libs' 'zlib')
makedepends=('git' 'cmake' 'lib32-glibc' 'llvm' 'python')
provides=('ispc')
conflicts=('ispc')
source=("git+https://github.com/ispc/ispc.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/packages/ispc/trunk/ispc-libclang-cpp.patch")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "ispc"

  patch -Np1 -i "$srcdir/ispc-libclang-cpp.patch"
}

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
