# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt6
_pkgname=gmt
pkgver=6.2.0rc1
pkgrel=1
pkgdesc="Generic Mapping Tools: Tools for manipulating and plotting geographic and Cartesian data"
arch=(x86_64)
url="https://www.generic-mapping-tools.org"
license=('LGPL')
makedepends=('cmake')
depends=('gdal' 'fftw' 'lapack')
optdepends=(
    'ghostscript'
    'python-sphinx'
    'gmt-coast: coastlines'
    'gmt-dcw: digital chart of the world polygon map')
conflicts=('gmt4' 'gmt')
install='gmt.install'
#source=("ftp://ftp.soest.hawaii.edu/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.star.nesdis.noaa.gov/pub/sod/lsa/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iris.washington.edu/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iag.usp.br/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
source=("https://github.com/GenericMappingTools/gmt/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.xz")
sha512sums=('6feb378c7378b703537427dfdb5acfad98862cd7733670d5a63fb0f2ed2fce6dda931e63300780eafa24e48bfb6f2a49c634812f54b1e6f25ac990f56b532f59')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rm -fr build && mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGMT_LIBDIR=lib \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DCOPY_GSHHG=OFF \
    -DCOPY_DCW=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DGMT_OPENMP=ON \
    ..
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
