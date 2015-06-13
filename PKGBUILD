# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=openscad-git
pkgver=20150518
pkgrel=1
pkgdesc="The programmers solid 3D CAD modeller"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://openscad.org/"
provides=('openscad')
conflicts=('openscad')
depends=('qt5-base' 'qscintilla-qt5' 'cgal' 'opencsg' 'boost-libs')
makedepends=('git' 'boost' 'eigen' 'imagemagick')
source=('git+https://github.com/openscad/openscad.git'
        'git+https://github.com/openscad/MCAD.git')
md5sums=('SKIP' 'SKIP')

_gitname="openscad"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  # submodules seem kind of weird with the detached bare repo
  cp -ar "$srcdir/MCAD" libraries
  rm -f libraries/MCAD/*.py
  rm -rf libraries/MCAD/.git/
  qmake-qt5 PREFIX="/usr" VERSION="$pkgver"
  make
  convert "icons/openscad.png" -resize 128x128\> "icons/openscad-128.png"
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir"  install
  install -Dm644 "icons/openscad.desktop" "$pkgdir/usr/share/applications/openscad.desktop"
  install -Dm644 "icons/openscad-128.png" "$pkgdir/usr/share/pixmaps/openscad.png"
}

