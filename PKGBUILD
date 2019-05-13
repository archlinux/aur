# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt6
_pkgname=gmt
pkghashver=e35dcdb027985864664d4c5f7e442a7b877344d4
pkgver=6.0.0_${pkghashver}
pkgrel=1
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="https://gmt.soest.hawaii.edu/"
license=('LGPL')
makedepends=('cmake')
depends=('gdal' 'fftw' 'lapack')
optdepends=(
    'ghostscript'
    'python-sphinx'
    'python2-sphinx'
    'gmt-coast: coastlines'
    'gmt-dcw: digital chart of the world polygon map')
conflicts=('gmt4' 'gmt')
install='gmt.install'
#source=("ftp://ftp.soest.hawaii.edu/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.star.nesdis.noaa.gov/pub/sod/lsa/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iris.washington.edu/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iag.usp.br/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("https://mirrors.ustc.edu.cn/gmt/${_pkgname}-${pkgver}-src.tar.xz")
source=("https://github.com/GenericMappingTools/${_pkgname}/archive/${pkghashver}.tar.gz")
md5sums=('e8a4801a39d68585a41a1be2070483a3')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkghashver}"
  rm -fr build && mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkghashver}/build"
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DGMT_LIBDIR=lib \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  export MAKEFLAGS="-j$(nproc)"
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkghashver}/build"
  make "DESTDIR=${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
