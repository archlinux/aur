# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmark-git
pkgver=0.29.0.r4.ga61c490
pkgrel=1
pkgdesc="CommonMark parsing and rendering library"
arch=('i686' 'x86_64')
url="https://github.com/commonmark/cmark"
license=('BSD' 'custom')
depends=('glibc')
makedepends=('git' 'cmake' 'python')
provides=('cmark')
conflicts=('cmark')
options=('staticlibs')
source=("git+https://github.com/commonmark/cmark.git")
sha256sums=('SKIP')


pkgver() {
  cd "cmark"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cmark"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ../
  make
}

check() {
  cd "cmark/_build"

  make test
}

package() {
  cd "cmark/"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/cmark/COPYING"
}
