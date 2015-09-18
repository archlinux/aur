# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=libspatialindex-git
pkgver=1.8.5
pkgrel=1
pkgdesc="C++ implementation of R*-tree, an MVR-tree and a TPR-tree with C API "
arch=('i686' 'x86_64')
url="http://libspatialindex.github.com/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'gtest')
provides=('libspatialindex')
conflicts=('libspatialindex')

_gitroot=https://github.com/libspatialindex/libspatialindex.git
_gitname=libspatialindex

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd $_gitname
    git checkout $pkgver
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
