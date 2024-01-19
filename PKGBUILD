# Maintainer: gigas002 <gigas002@pm.me>

_pkgname=fuzzylite
pkgname=$_pkgname-git
pkgver=r1042.9e47f8ac
pkgrel=1
pkgdesc="C++ fuzzy logic control library"
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('GPL3')
makedepends=('cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DFL_BUILD_STATIC=OFF \
    -DFL_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build build
}

check() {
  cd $srcdir/$_pkgname/build/bin

  ./fuzzylite-tests
}

package() {
  cd $srcdir/$_pkgname

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
