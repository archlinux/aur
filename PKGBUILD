# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt6
_pkgname=gmt
pkgver=6.0.0
pkgrel=4
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
source=("https://github.com/GenericMappingTools/gmt/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.xz"
        "https://github.com/GenericMappingTools/gmt/commit/2e159324ecfa38093c72119f62e9edb72f6f7424.patch")
sha512sums=('9719c8e3206a1c2b8ed05816e728549099c73673ae0c03fb3fbbb984bc7e0b20154ac93f6a74ed8e442d07636aba517818520cec41d4ffab1859e8fdb3435db2'
            '0ac53589b116a55b84879d3e6f7c6f119b3bee616e909c6ca01c8d20a7ed3015cda0b14444aa1c2679b2e9fa686250629768e32c76553c4d919a98c92ff2ea7c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/2e159324ecfa38093c72119f62e9edb72f6f7424.patch"
  rm -fr build && mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
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
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install || return 1
  install -d -m 0755 ${pkgdir}/usr/share/gmt/{html,pdf}
  install -d -m 0755 ${pkgdir}/usr/share/man/man1
  find "${srcdir}/${_pkgname}-${pkgver}/doc_release/html" -type f -exec install -m 0755 "{}" "${pkgdir}/usr/share/gmt/html" \;
  find "${srcdir}/${_pkgname}-${pkgver}/doc_release/pdf"  -type f -exec install -m 0755 "{}" "${pkgdir}/usr/share/gmt/pdf" \;
  find "${srcdir}/${_pkgname}-${pkgver}/man_release" -name "*.1.gz" -type f -exec install -m 0755 "{}" "${pkgdir}/usr/share/man/man1" \;
}

# vim:set ts=2 sw=2 et:
