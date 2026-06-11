pkgname=yasos-git
pkgver=r131.ed98fbf
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (git version)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD-3-Clause')
depends=('llvm')
makedepends=('git' 'cmake' 'make')
provides=('yasos')
conflicts=('yasos-bin')

source=("git+https://github.com/DameChocolateYa/yasos.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yasos"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/yasos"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build

  cd modules
 
  CFLAGS="-Wall -Wextra -O2 -fPIC -g -L/usr/lib/yslib -lys -fvisibility=hidden"
  make YS="$srcdir/yasos/build/yasos" \
         CFLAGS="$CFLAGS -I$srcdir/yasos/modules/headers"
}

package() {
  cd "$srcdir/yasos"

  install -Dm755 build/yasos "$pkgdir/usr/bin/yasos"

  install -d "$pkgdir/usr/lib/yslib"
  install -Dm755 modules/libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 modules/headers/*.ys "$pkgdir/usr/include/ysinclude/"

  install -d "$pkgdir/usr/include/ysinclude/c"
  install -m644 modules/headers/c/* "$pkgdir/usr/include/ysinclude/c"
}
