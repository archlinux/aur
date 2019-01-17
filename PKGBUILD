# Mantainer: Alberto Santini <alberto dot santini at upf dot edu>

pkgname='as-git'
pkgdesc='Header-only C++ library with utilities for Operational Research projects.'

pkgver=r53.1ebb0e3
pkgrel=2

arch=('x86_64')
url='https://github.com/alberto-santini/as'
license=('GPL3')
depends=('cplex' 'boost' 'boost-libs' 'discorde-git' 'exactcolors-git' 'cimg' 'pmc-git')
optdepends=('doxygen: To build the documentation' 'graphviz: To build the documentation')
ckeckdepends=('gtest')
source=("git+https://github.com/alberto-santini/as.git")
sha256sums=('SKIP')

_doc_built=0

pkgver() {
  cd "$srcdir/as"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/as"

  if (pacman -Qi doxygen >/dev/null && pacman -Qi graphvix >/dev/null); then
    doxygen Doxyfile
    _doc_built=1
  fi
}

check() {
  cd "$srcdir/as"
  mkdir -p build
  cd build

  cmake ..
  make

  ./as_test
}

package() {
  install -dm755 "$pkgdir/usr/include/as"
  install -m644 "$srcdir/as/src/"*.h "$pkgdir/usr/include/as"

  if [[ "$_doc_built" = "1" ]]; then
    install -dm755 "$pkgdir/usr/share/doc/as"
    cp -R "$srcdir/as/doc/"* "$pkgdir/usr/share/doc/as"
  fi
}
