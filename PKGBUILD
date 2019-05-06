# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt
pkghashver=6955525ec0502475b555cd4a2b5a71444ede0273
pkgver=6.0.0_${pkghashver}
pkgrel=1
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="http://gmt.soest.hawaii.edu/"
license=('GPL')
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
#source=("https://mirrors.ustc.edu.cn/gmt/${pkgname}-${pkgver}-src.tar.xz")
source=("https://github.com/GenericMappingTools/${pkgname}/archive/${pkghashver}.tar.gz")
md5sums=('8e7b84bb80aad7452f40c3e08cd38cb1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkghashver}"
  rm -fr build && mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkghashver}/build"
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
  cd "${srcdir}/${pkgname}-${pkghashver}/build"
  make "DESTDIR=${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
