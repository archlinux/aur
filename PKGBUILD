# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=mantid
pkgver=3.5.0
pkgrel=1
pkgdesc="Data analysis toolkit for neutron based instrument data"
url="http://www.mantidproject.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=(
  'libnexus'
  'qwt5'
  'qwtplot3d'
  'qscintilla'
  'boost'
  'poco'
  'muparser'
  'qtwebkit'
  'jsoncpp'
  'ipython2'
  'python2'
  'python2-numpy'
  'python2-pyqt4'
  'python2-pyzmq'
  'python2-scipy'
  'python2-sip'
  'hdf5-cpp-fortran'
  )
makedepends=('cmake')
source=("$pkgname::git://github.com/mantidproject/mantid.git#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
  #Currently the build fails because sphinx_bootstrap_theme isn't found
  #However it'll sidestep that requirement if it doesn't even find sphinx,
  #so for now let's just not build the built-in docs.
  sed -i -e 's/SPHINX_FOUND/FALSE/g' ${srcdir}/mantid/Code/Mantid/docs/CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DENABLE_OPENCASCADE=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYQT4_SIP_DIR=/usr/share/sip/PyQt4 \
        "${srcdir}/mantid/Code/Mantid"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
