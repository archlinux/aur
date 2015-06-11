# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andrew Belitsky <belitsky.a@gmail.com>

pkgname=mygui-ogre1.8
pkgver=3.2.2
pkgrel=2
pkgdesc="A multilayer and overlappable GUI System for OGRE. Built against OGRE 1.8."
arch=('i686' 'x86_64')
url="http://mygui.info/"
license=('LGPL')
depends=('boost-libs' 'ogre-1.8' 'ois')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu')
optdepends=('mygui-docs: documentation')
provides=('mygui')
source=("https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz")
sha512sums=('1290ce1d78b9e4bfe72bea3fb1bc6cdd25969b44be2844df62a1f425b3e221a68b61658fdf45271fb50a1957f12b5ada1c9be971e00ecfe41f53ae0a83ae18d4')

build() {
  cd $srcdir/mygui-MyGUI$pkgver

  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:$LD_LIBRARY_PATH"

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # generate CMake Makefile
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/MyGUI-OGRE1.8 \
    -DMYGUI_BUILD_DEMOS:BOOL=OFF \
    -DMYGUI_BUILD_DOCS:BOOL=OFF \
    -DMYGUI_BUILD_TEST_APP:BOOL=OFF \
    -DMYGUI_BUILD_TOOLS:BOOL=OFF \
    -DMYGUI_BUILD_PLUGINS:BOOL=OFF \
    -DOGRE_BUILD=/opt/OGRE-1.8 \
    -DOGRE_LIB_DIR=/opt/OGRE-1.8/lib \
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2/ \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {

  cd $srcdir/mygui-MyGUI$pkgver/build

  make DESTDIR="$pkgdir" install
}
