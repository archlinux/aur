# Maintainer: John Beard <john.j.beard@gmail.com>
pkgname=doxygen2docset-git
_gitname=doxygen2docset
pkgver=0.1.1.r1.g915de72
pkgrel=2
pkgdesc="Convert doxygen output to docset format"
arch=("any")
url="https://github.com/chinmaygarde/doxygen2docset"
license=("MIT")
source=("$_gitname::git+https://github.com/chinmaygarde/doxygen2docset.git#branch=master")
depends=("cmake")
makedepends=("git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install

  cd ../third_party
  install -Dm644 "googletest/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-googletest"
  install -Dm644 "gumbo/gumbo/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-gumbo"
  install -Dm644 "tinyxml2/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-tinyxml2"

  cd ..
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
