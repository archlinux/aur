# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.7
pkgrel=6
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-numpy' 'plplot510' 'gsl' 'readline' 'hdf5' 'netcdf' \
    'netcdf-cxx' 'wxgtk' 'fftw' 'udunits' 'pslib' 'grib_api' 'udunits' 'eigen3')
makedepends=('cmake')
options=('!makeflags')
source=(http://downloads.sourceforge.net/gnudatalanguage/gdl-${pkgver}.tgz \
    gdl.profile \
    gdl-template.patch \
    typedefs.patch)
md5sums=('0cd285d85e00e76e37b92310a76579c2'
         '40aa5fd8278cd8e80425c62a577563cc'
         '00f15c08d58033fcc6eb458524ca3433'
         '70d375261e0f83f39332d379f5c0b4a3')

prepare() {
  sed -i '1d' gdl-template.patch
  cd $srcdir/gdl-${pkgver}/
  patch -p1 < ../gdl-template.patch
  cd src/
  patch -p0 < ../../typedefs.patch
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
