# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf-git
pkgver=1.3.3.r10.g3730430
pkgver() {
  cd "$srcdir/$_gitname-build/src"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
provides=('libosmpbf')

_gitroot=https://github.com/scrosby/OSM-binary.git
_gitname=libosmpbf

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
  cd "$srcdir/$_gitname-build/src"

  make
}

package() {
  cd "$srcdir/$_gitname-build/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
