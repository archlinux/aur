# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=24.0.0
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
md5sums=('f2997272b685f9a319e7da3cffb3dae2'
         '905a328d53b0b7591f769e07c29c3937')
b2sums=('717c0f2fcc07c1ad0c17cf92ad3d665f9d14f0c873841f96062be30b55ad6bd9e60ba89b9db0e240bbf056f2d8a8c21117877b515f1368c69c6b6a13db464a3d'
        '6feffc1a3ff38014a9f644de778f0056f0f48787ce9a4d40bff8d27d8e42df2b05f258638150cadbd5b1a18d4697f35bf07cb8d9a78ba6357b8d94ef9d714874')

prepare() {
  # fix build with system arrow, skip failing tests
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars=ARROW_R_ALLOW_CPP_VERSION_MISMATCH=true
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
