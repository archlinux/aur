# Maintainer: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.5
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-numpy' 'plplot' 'gsl' 'readline' 'hdf5' 'netcdf' \
    'netcdf-cxx-legacy' 'wxgtk' 'fftw' 'udunits' 'pslib' 'grib_api' \
    'udunits' 'eigen3')
makedepends=('cmake')
options=('!makeflags')
source=(http://downloads.sourceforge.net/gnudatalanguage/gdl-${pkgver}.tar.gz \
    gdl.profile)
md5sums=('2d02283c544820729479a57545d5b599'
         '40aa5fd8278cd8e80425c62a577563cc')

build() {
  cd $srcdir/gdl-${pkgver}
  if [[ -d build ]]; then
      rm -r build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=2.7 \
      -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
      -DMAGICK=NO -DFFTW=YES -DHDF5=YES -DHDF=NO -DGRIB=YES -DUDUNITS=YES \
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
