# $Id$
# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=mayavi
pkgver=4.4.2
pkgrel=1
pkgdesc="A 3-dimensional visualizer of scientific data"
arch=('i686' 'x86_64')
url="https://github.com/enthought/mayavi"
license=('BSD')
depends=('ipython2' 'vtk' 'python2-envisage' 'python2-pyqt4')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-twisted' 'xorg-server-xvfb')
replaces=('python2-mayavi')
provides=('python2-mayavi')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/enthought/mayavi/archive/${pkgver}.tar.gz"
        "mayavi.sh" "mayavi.csh")
md5sums=('2ac30719b2754d13cb20236654554ac4'
         '6d36bbfb69010e313292cfee4982487f'
         '91eb92abc506a00c29afcb37c9600914')

prepare() {
  cd "$srcdir"/mayavi-$pkgver

  # force selection of wxpython 2.8
  sed -e "s/wxversion.ensureMinimal('2.8')/wxversion.select('2.8')/g" -i $(find . -name '*.py')

  # Use python2-sphinx provided sphinx-build2
  sed -i -e 's/sphinx-build/sphinx-build2/' docs/Makefile*

  # Fix distutils compatibility
  sed -i -e 's/distutils.Version/distutils.version/' mayavi/modules/text.py
  sed -i -e 's/distutils.Version/distutils.version/' tvtk/tools/mlab.py

  # set path so autodoc can find just built modules
  echo "sys.path.append('$srcdir/enthought-mayavi-${_githubtag}/build/lib.linux-$CARCH-2.7/')" >> docs/source/mayavi/conf.py

  # fix python->python2
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*[\._]py')
}

build() {
  cd "$srcdir"/mayavi-$pkgver
  rm -rf build
  mkdir build
  mkdir -p build/lib.linux-$CARCH-2.7/{tvtk/plugins/scene,mayavi/preferences,mayavi/core}
  ln -s "$srcdir"/enthought-mayavi-${_githubtag}/tvtk/tvtk_classes.zip \
    build/lib.linux-$CARCH-2.7/tvtk/tvtk_classes.zip
  ln -s "$srcdir"/enthought-mayavi-${_githubtag}/mayavi/preferences/preferences.ini \
    build/lib.linux-$CARCH-2.7/mayavi/preferences/preferences.ini
  ln -s "$srcdir"/enthought-mayavi-${_githubtag}/tvtk/plugins/scene/preferences.ini \
    build/lib.linux-$CARCH-2.7/tvtk/plugins/scene/preferences.ini

  # force using Qt during build
  export ETS_TOOLKIT=qt4

  # now this is ugly, but docs do not build without X. We setup X according to:
  # http://docs.enthought.com/mayavi/mayavi/tips.html#rendering-using-the-virtual-framebuffer
  export DISPLAY=:69
  Xvfb $DISPLAY &

  # build!
  python2 setup.py build

  # have to kill the server to proceed, and do other cleanup
  kill `cat /tmp/.X${DISPLAY/:/}-lock`
  rm build/lib.linux-$CARCH-2.7/tvtk/tvtk_classes.zip
  rm build/lib.linux-$CARCH-2.7/mayavi/preferences/preferences.ini
  rm build/lib.linux-$CARCH-2.7/tvtk/plugins/scene/preferences.ini
}

package() {
  cd "$srcdir"/mayavi-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  cp -r docs/build/* "${pkgdir}"/usr/lib/python2.7/site-packages

  # switch to PyQt by default, fix FS#41791
  install -d "${pkgdir}"/etc/profile.d
  install -Dm644 "${srcdir}"/mayavi.sh "${pkgdir}"/etc/profile.d/mayavi.sh
  install -Dm644 "${srcdir}"/mayavi.csh "${pkgdir}"/etc/profile.d/mayavi.csh

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

