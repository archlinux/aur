# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quanteda
_pkgver=4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative Analysis of Textual Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-fastmatch
  r-jsonlite
  r-lifecycle
  r-magrittr
  r-rcpp
  r-snowballc
  r-stopwords
  r-stringi
  r-xml2
  r-yaml
  onetbb
)
checkdepends=(
  r-dplyr
  r-lda
  r-lsa
  r-purrr
  r-testthat
  r-text2vec
  r-tidytext
  r-tm
  r-topicmodels
)
optdepends=(
  r-formatr
  r-knitr
  r-lsa
  r-rlang
  r-rmarkdown
  r-slam
  r-spelling
  r-testthat
  r-tm
  r-torch
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('a2dbfe4c0bda1f7b05775e37fdf65ab4'
         'fd46ba9ed33ccf9a5ae1e79737fd5c21')
b2sums=('bd012b05717d0858b90f68400239e8bd06b0a127bfbc9e7a6ea230f5199d8bf5dcd5f07a67e15b0328eaeb1fb91edadae196ffb25249ede135b9fc17c12dc90a'
        'a8123128d9c00cf99f8d3d059886c2c3a5a175deca05f8281f3db2e0b01f418e7e5cfaf7fe0f8f0fe4c5dd7db262b07c15062b5267a65b74d7b80719740b10e8')

prepare() {
  # Skip failing test
  patch -Np1 -i skip-tests.patch
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
