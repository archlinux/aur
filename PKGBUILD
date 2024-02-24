# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=14.0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integration to 'Apache' 'Arrow'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  arrow
  r-assertthat
  r-bit64
  r-glue
  r-purrr
  r-r6
  r-rlang
  r-tidyselect
  r-vctrs
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-blob
  r-curl
  r-dplyr
  r-hms
  r-lubridate
  r-reticulate
  r-stringr
  r-testthat
)
optdepends=(
  r-blob
  r-cli
  r-curl
  r-dbi
  r-dbplyr
  r-decor
  r-distro
  r-dplyr
  r-duckdb
  r-hms
  r-jsonlite
  r-knitr
  r-lubridate
  r-pillar
  r-pkgload
  r-reticulate
  r-rmarkdown
  r-stringi
  r-stringr
  r-sys
  r-testthat
  r-tibble
  r-tzdb
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('aaf2deb867c78ca49e5cb4e5931a42b4'
         '583d52743ac4b0c6fc0d9b9dd3ebce49')
b2sums=('db02956a4fca2bf7218d6f580cafaf2cacf27650a602cc04b72a3c6d1cfecb6951b9becce01fc88723fa6175b80d851fcaeae80346ed1bf1f23909b41463e432'
        '8d44a056f4885e03bf97b30066302d6ccfef738baeb761ba7e6c32ec547b83c5a3d202ff8e44e98de4afa786240e937e9a0bd9eb2dcaa3992226607953939e2d')

prepare() {
  # fix build with system arrow, skip failing tests
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars=ARROW_R_ALLOW_CPP_VERSION_MISMATCH=true
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
