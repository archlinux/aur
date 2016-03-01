# Maintainer:  <gucong@gc-desktop>
pkgname=engrid-git
_gitname=engrid
pkgver=20140919.670493c4
pkgrel=1
pkgdesc="open-source mesh generation"
arch=('i686' 'x86_64')
url="http://engits.eu/en/engrid"
license=('GPL')
depends=(vtk qt5-base cgal)
makedepends=(git subversion)
source=("git+https://github.com/enGits/$_gitname.git#branch=qt5")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

prepare() {
  #  cd "$srcdir/$_gitname"
  #  git merge origin/qt5 -Xtheirs -m 'merge branch qt5'
  cd "$srcdir"
  
  [ -e build ] && rm -rf build
  mkdir build
  sed -i 's/STATIC/SHARED/g' "$srcdir/engrid/src/tetgen/CMakeLists.txt"
  echo 'install(TARGETS tet LIBRARY DESTINATION lib)' >> "$srcdir/engrid/src/tetgen/CMakeLists.txt"
  sed -i '/vtkRenderingCore_AUTOINIT/d' "$srcdir/engrid/src/libengrid/engrid.h"
}

build() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DQT5_INC_DIR:PATH=/usr/include/qt \
        -DQT5_TOOLS_INC_DIR:PATH=/usr/include/qt \
        "../$_gitname/src"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
