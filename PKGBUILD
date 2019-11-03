# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt
pkgver=6.0.0
pkgrel=1
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="http://gmt.soest.hawaii.edu/"
license=('LGPL')
makedepends=('cmake')
depends=('gdal' 'fftw' 'lapack')
optdepends=(
    'ghostscript'
    'python-sphinx'
    'python2-sphinx'
    'gmt-coast: coastlines'
    'gmt-dcw: digital chart of the world polygon map')
conflicts=('gmt4')
install='gmt.install'
#source=("ftp://ftp.soest.hawaii.edu/gmt/${pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.star.nesdis.noaa.gov/pub/sod/lsa/gmt/${pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iris.washington.edu/pub/gmt/${pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iag.usp.br/pub/gmt/${pkgname}-${pkgver}-src.tar.xz")
source=("https://mirrors.ustc.edu.cn/gmt/${pkgname}-${pkgver}-src.tar.xz")
md5sums=('2721f3bd7f39eb7c8ea261f644c5c36e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/\*\.1\.gz/\*\.1gmt\.gz/g' doc/rst/CMakeLists.txt
  sed -i 's/\*\.3\.gz/\*\.3gmt\.gz/g' doc/rst/CMakeLists.txt
  sed -i 's/\*\.5\.gz/\*\.5gmt\.gz/g' doc/rst/CMakeLists.txt
  rm -fr build && mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DGMT_LIBDIR=lib \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DCMAKE_BUILD_TYPE=Release \
    -DGMT_OPENMP=ON \
    ..
  export MAKEFLAGS="-j1"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make docs_man
  cd doc/rst/man \
  && for i in $(ls *.1.gz); do mv $i ${i%".1.gz"}.1gmt.gz; done \
  && for i in $(ls *.3.gz); do mv $i ${i%".3.gz"}.3gmt.gz; done \
  && for i in $(ls *.5.gz); do mv $i ${i%".5.gz"}.5gmt.gz; done \
  && cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
