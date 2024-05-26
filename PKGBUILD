# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=16.1.0
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
md5sums=('25fcb98f5dfcdc191a351eb80f591a35'
         '905a328d53b0b7591f769e07c29c3937')
b2sums=('1953b029a525e8ddee6ef682f21a6a8025cf0cd49825284ba537020310664adaf5e4cb8d10163a11003ac0aefdf888b59a0f53fcb5c5d331a89525fe0919b97a'
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

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
