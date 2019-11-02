# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt6
_pkgname=gmt
pkgver=6.0.0
pkgrel=1
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="https://www.generic-mapping-tools.org"
license=('LGPL')
makedepends=('cmake' 'ninja')
depends=('gdal' 'fftw' 'lapack' 'python-sphinx' 'ghostscript')
optdepends=(
    'gmt-coast: coastlines'
    'gmt-dcw: digital chart of the world polygon map')
conflicts=('gmt4' 'gmt')
install='gmt.install'
#source=("ftp://ftp.soest.hawaii.edu/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.star.nesdis.noaa.gov/pub/sod/lsa/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iris.washington.edu/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iag.usp.br/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("https://mirrors.ustc.edu.cn/gmt/${_pkgname}-${pkgver}-src.tar.xz")
source=("https://github.com/GenericMappingTools/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7a733e670f01d99f8fc0da51a4337320d764c06a68746621f83ccf2e3453bcb7')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
  mkdir -p "${srcdir}/build/aur"
  cd "${srcdir}/build/aur"
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DGMT_LIBDIR=lib \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    "${srcdir}/${_pkgname}-${pkgver}"
  export MAKEFLAGS="-j$(nproc)"
  ninja || return 1
}

package() {
  cd "${srcdir}/build/aur"
  ninja docs_html docs_man
  cd doc/rst/man \
  && cd "${srcdir}/build/aur"
  DESTDIR="${pkgdir}" ninja install || return 1
}

# vim:set ts=2 sw=2 et:
