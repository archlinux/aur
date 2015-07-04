# Contributor: Benjamin Sick

pkgname=gmt
pkgver=5.1.2
pkgrel=1
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="http://gmt.soest.hawaii.edu/"
license=('GPL')
makedepends=('cmake')
depends=('gdal' 'fftw')
optdepends=('ghostscript' 'python-sphynx' 'python2-sphynx' 'gmt-coast' 'gmt-dcw')
conflicts=('gmt4')
install=gmt.install
source=(ftp://ftp.soest.hawaii.edu/gmt/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('66212f2f237843a448fa9c0ec6cfb86d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -fr build
  mkdir build && cd build
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DGMT_LIBDIR=lib \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DCMAKE_BUILD_TYPE=Release ..
  export MAKEFLAGS="-j1"
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install || return 1
}

# vim:set ts=2 sw=2 et:
