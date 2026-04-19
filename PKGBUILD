# Maintainer: gigas002 <gigas002@pm.me>

_pkgname=fuzzylite
pkgname=$_pkgname-git
pkgver=r1089.fe62b61
pkgrel=1
pkgdesc="C++ fuzzy logic control library"
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('GPL-3.0-only')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
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
  cd "$srcdir/$_pkgname/build/bin"

  ./fuzzylite-tests
}

package() {
  cd "$srcdir/$_pkgname"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 "$_pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
