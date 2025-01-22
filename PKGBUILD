# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=spam
_pkgver=2.11-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SPArse Matrix"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-only OR BSD-3-Clause')
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
md5sums=('3fa1675369dc036a1431e35f1b447951')
b2sums=('5ea3ef57f4f0d76dba4e547b7d88534611de5d1336b7b71775012b0cdeaec0321d0ce0d3abd4267b00843210b22dff6fa8284aca7e96d9a0428b94e64227fd4f')

prepare() {
  # skip tests that require r-fields
  sed -i "/require('fields')/i skip_if_not_installed('fields')" \
      "$_pkgname/tests/testthat/test-rmvnorm.R"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
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
