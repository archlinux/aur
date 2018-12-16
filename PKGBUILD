# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.8
pkgrel=3
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-numpy' 'plplot510' 'gsl' 'readline' 'hdf5' 'netcdf' \
    'netcdf-cxx' 'wxgtk' 'fftw' 'udunits' 'pslib' 'grib_api' 'udunits' 'eigen3' \
    'libtirpc')
makedepends=('cmake')
options=('!makeflags')
source=(http://downloads.sourceforge.net/gnudatalanguage/gdl-${pkgver}.tgz \
    gdl-tirpc.patch \
    gdl.profile)
md5sums=('451532f1263bbaa8745a4ca8978533c0'
         'cad6430a812e906ee7f1e15b4589dcac'
         '40aa5fd8278cd8e80425c62a577563cc')

prepare() {
  cd $srcdir/gdl-${pkgver}/
  patch -p1 < ../gdl-tirpc.patch
}

build() {
  cd $srcdir/gdl-${pkgver}
  if [[ -d build ]]; then
      rm -r build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=2.7 \
      -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
      -DMAGICK=NO -DFFTW=YES -DHDF5=NO -DHDF=NO -DGRIB=YES -DUDUNITS=YES \
      -DCMAKE_C_FLAGS="-I/usr/include/ImageMagick \
            -I/usr/include/python2.7 \
            -I/usr/lib/python2.7/site-packages/numpy/core/include" ..
  make
}

package() {
  cd $srcdir/gdl-${pkgver}/build
  make DESTDIR=$pkgdir install

  install -D -m755 ../../gdl.profile $pkgdir/etc/profile.d/gdl.sh
}
