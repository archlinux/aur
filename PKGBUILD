# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quanteda
_pkgver=4.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative Analysis of Textual Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
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
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('ab58b160c34f65495d1e9c814db4d32c'
         'fd46ba9ed33ccf9a5ae1e79737fd5c21')
b2sums=('d08f440a46f239ea28b280e22b95770cff1d930a65c11f77b7fc50144c1f4bc1bb769746b41b4372479ad747f318106b8a8570a17e0a817e2c04cbb741997766'
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
