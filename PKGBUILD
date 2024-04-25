# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=samplingbook
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Survey Sampling Procedures"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-pps
  r-sampling
  r-survey
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('ac486645595a901abdba5a07179b47d3'
         '611e766518fb9d6b1d861f71e26e9e31')
b2sums=('ce2a279f6d10e46eb2caacc593ef222082230681fe7ad94958d0048867177630f7b41f27caf8d77ee21f7ddf19e70468d4cecd154db0bdd3cd1c032ffe351424'
        'f2b164479c39c296f93ab1e320c88f626193cd3e28e726d453d84984035efebff786eb4831b4c686812b31faa64f54ddbab6ddc6ffbe64ab847fc38651f915c8')

prepare() {
  # fix tests
  patch -Np1 -i fix-tests.patch
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
}
