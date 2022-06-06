# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rgin
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=1
pkgdesc='gin in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-rcppeigen
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ae18bf9e748671366ad65c3de03552da49db4cff6ba08601759ef5c9a90bff4')

prepare() {
  sed -i 's#PKG_CXXFLAGS = #PKG_CXXFLAGS = -I/usr/lib/R/library/Rcpp/include #' "${_pkgname}/src/Makevars"
  tar cfz "${_pkgname}.tar.gz" "${_pkgname}"
}

build() {
  #R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # delete unneeded object files
  find "${pkgdir}/usr/lib/R/library/${_pkgname}" -type f -name "*.o" -delete
}
# vim:set ts=2 sw=2 et:
