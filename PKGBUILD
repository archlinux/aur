# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=scribus-git
pkgver=latest
pkgrel=4
pkgdesc="Desktop publishing software built from git mirror"
arch=('i386' 'x86_64')
url="https://www.scribus.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'librevenge' 'harfbuzz-icu')
makedepends=('git' 'cmake')
conflicts=('scribus')
source=("no-python.patch")
md5sums=('c2745f610c86aa58fb81090eb2480f2d')

_gitroot="https://github.com/scribusproject/scribus.git"
_gitname="scribus"

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
    cd "$_gitname"
    patch -p1 -i "$srcdir/no-python.patch"
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

}

build() {
  cd "$srcdir/$_gitname/build"
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
