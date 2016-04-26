# Maintainer: Dominik Heidler <dheidler@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor:	Jonatan Sastre <jsastreh [ at ] hotmail.com>
pkgname=gnuradio-git
_gitname=gnuradio
pkgver=v3.7.9.2.178.g6a33fff
pkgrel=1
pkgdesc="General purpose DSP and SDR toolkit.  With drivers for usrp and fcd."
arch=('i686' 'x86_64')
url="http://gnuradio.org"
license=('GPL')
depends=('fftw' 'python2-numpy' 'cppunit' 'gsl' 'blas' 'guile' 'boost-libs>=1.53' 'libusbx' 'portaudio' 'libuhd' 'zeromq' 'libvolk-git')
makedepends=('git' 'boost' 'cmake' 'python2-lxml' 'python2-cheetah' 'glu' 'swig'
    'pygtk' 'wxpython' 'python2-pyqwt' 'qwtplot3d')
optdepends=('boost: gr_modtool'
            'swig: gr_modtool'
            'cmake: gr_modtool'
            'pkgconfig: libuhd'
            'python2-cheetah: grc'
            'python2-lxml: grc'
            'pygtk: grc'
            'wxpython: grc'
            'python2-opengl: grc'
            'python2-pyqwt: grc'
            'qwtplot3d: grc'
            'python2-numarray: grc')
source=("git://github.com/gnuradio/gnuradio.git")
md5sums=('SKIP')
conflicts=('gnuradio')
provides=('gnuradio')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  export PYTHON=python2
  cd "$srcdir/$_gitname"

  sed -i -e "s|GR_PKG_LIBEXEC_DIR|GR_RUNTIME_DIR|" grc/scripts/freedesktop/CMakeLists.txt
  sed -i -e "s|/qwt$|/qwt5|" -e "s| qwt | qwt5 |" cmake/Modules/FindQwt.cmake
  sed -i -e "s| sphinx-build$| sphinx-build2|" cmake/Modules/FindSphinx.cmake
  msg "Starting build."
  mkdir -p build
  cd build
  cmake \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DENABLE_GRC=ON \
    -DENABLE_GR_WXGUI=ON \
    -DENABLE_GR_QTGUI=ON \
    -DENABLE_INTERNAL_VOLK=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

check() {
  cd "$srcdir/$_gitname/build"
  export PYTHON=python2
  #make test
}

package() {
  cd "$srcdir/$_gitname/grc/scripts/freedesktop"
  install -Dm644 gnuradio-grc.desktop "$pkgdir/usr/share/applications/$pkgbase.desktop"
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
  msg "Replacing filenames to use python2."
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "$pkgdir" -name '*.py') \
    $(find "$pkgdir" -name 'gnuradio-companion' -o -name 'flow_graph.tmpl')
  sed -i -e "s|#![ ]*/usr/bin/env /usr/bin/python$|#!/usr/bin/env python2|" \
    $(find "$pkgdir" -name '*.py')
  find "$pkgdir/" -name '*.pyc' -delete
  find "$pkgdir/" -name '*.pyo' -delete
}
