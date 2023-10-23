# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=spam
_pkgver=2.10-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SPArse Matrix"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(BSD)
depends=(
  blas
  lapack
  r-dotcall64
  r-rcpp
)
makedepends=(
  gcc-fortran
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-fields
  r-knitr
  r-r.rsp
  r-rmarkdown
  r-spam64
  r-testthat
  r-truncdist
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('544bbc0a7ae76ef34ed01bf61c666f82')
sha256sums=('719c86a23801ecf051ffd8291912ee3567af4010e74af470fbf09e274728ac79')

prepare() {
  # skip tests that require r-fields
  sed -i "/require('fields')/i skip_if_not_installed('fields')" \
      "$_pkgname/tests/testthat/test-rmvnorm.R"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
