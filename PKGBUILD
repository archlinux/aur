# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=scribus-git
pkgver=latest
pkgrel=2
pkgdesc="Desktop publishing software built from git mirror"
arch=('i386' 'x86_64')
url="https://www.scribus.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'librevenge' 'harfbuzz-icu')
makedepends=('git' 'cmake')
conflicts=('scribus')

_gitroot="https://github.com/scribusproject/scribus.git"
_gitname="scribus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
