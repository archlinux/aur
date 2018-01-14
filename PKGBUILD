# Maintainer:
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andrew Belitsky <belitsky.a@gmail.com>

pkgname=mygui-ogre1.9
pkgver=3.2.2
pkgrel=2
pkgdesc="A multilayer and overlappable GUI System for OGRE - build against OGRE 1.9"
arch=('i686' 'x86_64')
url="http://mygui.info/"
license=('LGPL')
depends=('boost-libs' 'ogre-1.9' 'ois')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu')
optdepends=('mygui-docs: documentation')
source=("https://github.com/MyGUI/mygui/archive/MyGUI$pkgver.tar.gz")
sha256sums=('0a28d7ec8a47993cb68deb48b36331e28f12dd92580b709eaef21d599b67a78f')

prepare() {
  sed -i '19i "/opt/OGRE-1.9/lib/OGRE/cmake"' mygui-MyGUI$pkgver/CMakeLists.txt
  mkdir -p build
}

build() {
  cd build

  export PKG_CONFIG_PATH="/opt/OGRE-1.9/lib/pkgconfig:$PKG_CONFIG_PATH"

  cmake ../mygui-MyGUI$pkgver \
    -DCMAKE_INSTALL_PREFIX=/opt/MyGUI-OGRE1.9 \
    -DMYGUI_BUILD_DEMOS:BOOL=OFF \
    -DMYGUI_BUILD_DOCS:BOOL=OFF \
    -DMYGUI_BUILD_TEST_APP:BOOL=OFF \
    -DMYGUI_BUILD_TOOLS:BOOL=OFF \
    -DMYGUI_BUILD_PLUGINS:BOOL=OFF \
    -DOGRE_BUILD=/opt/OGRE-1.9 \
    -DOGRE_LIB_DIR=/opt/OGRE-1.9/lib \
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2/ \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
