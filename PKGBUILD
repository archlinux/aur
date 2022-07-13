# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=openscad-git
pkgver=20220626
pkgrel=1
pkgdesc="The programmers solid 3D CAD modeller"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://openscad.org/"
provides=('openscad')
conflicts=('openscad')
depends=('qt5-base' 'qscintilla-qt5' 'cgal' 'opencsg' 'boost-libs'
         'qt5-multimedia' 'libzip' 'qt5-gamepad')
makedepends=('git' 'boost' 'eigen' 'imagemagick' 'ccache')
source=('git+https://github.com/openscad/openscad.git'
        'git+https://github.com/openscad/MCAD.git'
        'git+https://github.com/microsoft/mimalloc.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

_gitname="openscad"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
  #git describe --always --tags | sed 's/-/./g'
}

prepare() {
  cd "$_gitname"
  # I am amazed that people are willing to avoid using sources(),
  # and download stuff inside of build() instead.
  # "git submodule update --init" is not okay.

  cp -ar "$srcdir/MCAD" libraries
  #rm -f libraries/MCAD/*.py
  rm -rf libraries/MCAD/.git/

  cp -ar "$srcdir/mimalloc" submodules
  rm -rf submodules/mimalloc/.git/

  sed -i 's/ping files.openscad.org/ping archlinux.org/' resources/CMakeLists.txt
  # todo: download the docs with sources() too
}

build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DEXPERIMENTAL=ON -DOFFLINE_DOCS=ON ..
  make
  cd ..
  convert "resources/icons/openscad.png" -resize 128x128\> "resources/icons/openscad-128.png"
}

package() {
  cd "$_gitname/build"
  make INSTALL_ROOT="$pkgdir"  install
  cd "$_gitname"
  install -Dm644 "resources/icons/openscad.desktop" "$pkgdir/usr/share/applications/openscad.desktop"
  install -Dm644 "resources/icons/openscad-128.png" "$pkgdir/usr/share/pixmaps/openscad.png"
}

