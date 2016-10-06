# $Id$
# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=mayavi
pkgver=4.5.0
pkgrel=2
pkgdesc="A 3-dimensional visualizer of scientific data"
arch=('i686' 'x86_64')
url="https://github.com/enthought/mayavi"
license=('BSD')
depends=('ipython2' 'vtk6' 'python2-envisage' 'python2-traitsui' 'python2-configobj' 'wxpython2.8'
         'gdal' 'unixodbc' 'jsoncpp' 'hdf5' 'openmpi' 'libtheora' 'ffmpeg' 'qt5-base')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-twisted' 'xorg-server-xvfb')
replaces=('python2-mayavi')
provides=('python2-mayavi')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/enthought/mayavi/archive/${pkgver}.tar.gz"
        "mayavi.sh" "mayavi.csh" "vtk6.patch" "setuptools.patch")
md5sums=('ed3b0004b810bd5741ae9bb46d197250'
         '3e998f4f3cb1d9bc3353fbb933984458'
         'd68e29e3c805ad2e0a5e82b1744b1f0a'
         '1b91b3aaf31a44ddc5e770f4fb1e3c5f'
         'fa81f3c6610942dedd072ef55428c41b')

prepare() {
  cd "$srcdir"/mayavi-$pkgver

  # patch to force VTK6
  patch -p1 < ../vtk6.patch

  # patch to fix setuptools 28.0 --- https://github.com/enthought/mayavi/issues/443
  patch -p1 < ../setuptools.patch

  # force selection of wxpython 2.8
  sed -e "s/wxversion.ensureMinimal('2.8')/wxversion.select('2.8')/g" -i $(find . -name '*.py')

  # fix wrong-file-end-of-line-encoding
  for file in *.txt examples/mayavi/data/room_vis.wrl examples/tvtk/dscene.py \
    examples/mayavi/interactive/wx_mayavi_embed*.py ; do
    sed "s|\r||g" $file > $file.new && \
    touch -r $file $file.new && \
    mv $file.new $file
  done

  # file-not-utf8
  for file in *.txt docs/*.txt; do
    iconv -f ISO-8859-1 -t UTF-8 -o $file.new $file && \
    touch -r $file $file.new && \
    mv $file.new $file
  done

  # remove exec permission
  find examples -type f -exec chmod 0644 {} ";"
  chmod 0644 mayavi/tests/data/cellsnd.ascii.inp

  # set path so autodoc can find just built modules
  echo "sys.path.append('$srcdir/mayavi-$pkgver/build/lib.linux-$CARCH-2.7/')" >> docs/source/mayavi/conf.py

  # Use python2-sphinx provided sphinx-build2
  sed -i -e 's/sphinx-build/sphinx-build2/' docs/Makefile*

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

  # now this is ugly, but docs do not build without X. We setup X according to:
  # http://docs.enthought.com/mayavi/mayavi/tips.html#rendering-using-the-virtual-framebuffer
  export DISPLAY=:69
  Xvfb $DISPLAY &

  # build!
  export ETS_TOOLKIT="wx"
  python2 setup.py build

  # have to kill the server to proceed, and do other cleanup
  kill `cat /tmp/.X${DISPLAY/:/}-lock`
  rm build/lib.linux-$CARCH-2.7/tvtk/tvtk_classes.zip
  rm build/lib.linux-$CARCH-2.7/mayavi/preferences/preferences.ini
  rm build/lib.linux-$CARCH-2.7/tvtk/plugins/scene/preferences.ini
}

package() {
  cd "$srcdir"/mayavi-$pkgver

  python2 setup.py install --skip-build --root="$pkgdir"/ --optimize=1

  # remove useless files
  rm -f "${pkgdir}"/usr/lib/python2.7/site-packages/tvtk/setup.py*
  find "${pkgdir}" -name \.buildinfo -type f -print | xargs rm -f -

  # non-executable-script
  chmod +x "${pkgdir}"/usr/lib/python2.7/site-packages/mayavi/tests/runtests.py

  # install manpage
  mkdir -p "${pkgdir}"/usr/share/man/man1
  cp -p docs/mayavi2.man "${pkgdir}"/usr/share/man/man1/mayavi2.1

  # switch to Wx, as PyQT no longer works, FS#41791 no longer fixed :(
  install -d "${pkgdir}"/etc/profile.d
  install -Dm644 "${srcdir}"/mayavi.sh "${pkgdir}"/etc/profile.d/mayavi.sh
  install -Dm644 "${srcdir}"/mayavi.csh "${pkgdir}"/etc/profile.d/mayavi.csh

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
