# $Id: PKGBUILD 226145 2017-04-28 06:17:53Z svenstaro $
# Maintainer: Oskar Sveinsen
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui
pkgver=0.8.7
_tag=0-8-7
pkgrel=9
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=('pcre' 'glew' 'expat' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51' 'silly')
makedepends=('cmake' 'python2' 'doxygen' 'ogre' 'gtk2' 'boost' 'graphviz' 'irrlicht' 'glm' 'mesa' 'tolua++' 'mercurial' 'ois')
optdepends=('ogre: ogre module'
            'python2: python bindings'
            'ois: running samples'
            'gtk2: gtk2 module'
            'irrlicht: irrlicht module')
source=("hg+https://bitbucket.org/cegui/cegui#tag=v${_tag}")
md5sums=('SKIP')

build() {
  cd "$srcdir/cegui"

  sed -i "s/lib64/lib/g" CMakeLists.txt

  # workaround from http://www.cegui.org.uk/forum/viewtopic.php?f=10&t=7195#p34902
  sed -i '/#include "tolua++.h"/{h;d};/#include "lauxlib.h"/G' "cegui/src/ScriptModules/Lua/support/tolua++bin/tolua.c"

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCEGUI_LIB_INSTALL_DIR=lib \
      -DCEGUI_BUILD_PYTHON_MODULES=OFF \
      -DCEGUI_BUILD_PYTHON_MODULES=ON \
      -DPYTHON_EXECUTABLE=/usr/bin/python2

  make
  make html
}

package() {
  cd "$srcdir/cegui"/build

  make DESTDIR="${pkgdir}" install

  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
