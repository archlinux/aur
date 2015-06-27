# Maintainer: Vincent Prelat <prelatv [at] gmail.com>

pkgname=qadastre2osm-git
pkgver=20130303
pkgrel=1
pkgdesc="Generate OpenStreetMap files from the french cadastre through its PDF export"
arch=('i686' 'x86_64')
url="http://gitorious.org/qadastre/qadastre2osm"
license=('GPL')
groups=()
depends=('podofo')
makedepends=('git' 'qt4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('podofo.patch')
noextract=()
md5sums=('90f8c050cb13408405da0b9b354d3392')

_gitroot="git://gitorious.org/qadastre/qadastre2osm.git"
_gitname="qadastre2osm"

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

  #
  # BUILD HERE
  #
  patch -p0 < "../podofo.patch"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d $pkgdir/usr/
  install -d $pkgdir/usr/bin
  install -m 755 Qadastre2OSM "$pkgdir/usr/bin/Qadastre2OSM"
}
