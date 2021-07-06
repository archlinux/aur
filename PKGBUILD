# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=binaryen-git
pkgver=r6565.gcdf9ee0fd
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly"
arch=('i686' 'x86_64')
url="https://github.com/WebAssembly/binaryen"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
#checkdepends=('python')
provides=('binaryen')
conflicts=('binaryen')
source=("git+https://github.com/WebAssembly/binaryen.git"
        "binaryen.sh::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/binaryen/trunk/binaryen.sh")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "binaryen"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "binaryen"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "binaryen/_build"

  #python ../check.py
}

package() {
  cd "binaryen"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/binaryen.sh" -t "$pkgdir/etc/profile.d"
}
