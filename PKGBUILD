# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quanteda
_pkgver=3.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Quantitative Analysis of Textual Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-fastmatch
  r-jsonlite
  r-magrittr
  r-rcpp
  r-rcppparallel
  r-snowballc
  r-stopwords
  r-stringi
  r-xml2
  r-yaml
)
makedepends=(
  r-rcpparmadillo
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
  r-dplyr
  r-formatr
  r-ggplot2
  r-knitr
  r-lda
  r-lsa
  r-purrr
  r-quanteda.textmodels
  r-quanteda.textplots
  r-quanteda.textstats
  r-rcolorbrewer
  r-rmarkdown
  r-slam
  r-spacyr
  r-spelling
  r-stm
  r-testthat
  r-text2vec
  r-tibble
  r-tidytext
  r-tm
  r-tokenizers
  r-topicmodels
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "std-atomic.patch")
md5sums=('b34e0169f0ac07848ecf17dc32585cd9'
         '09a300caa20e8b24350b8999388a42a2')
b2sums=('eea198adf7214955560d2a39c83355925a8282ae814fcb4a7bc332d4c5a791e1d4ddc4af34ec4082b5304fc98b07df09e6be60a5036bb75e20790b8715246a30'
        'aa84229d25909d3c4054775df808fe9b0d1a76c33bc04dc477d22c801f8888985030e5f9cbcbc5a5897ee4a19a60eabbcb854ebfcc0b424bf5d6624680fbb60e')

prepare() {
  # Switch from tbb::atomic to std::atomic to allow building with newer tbb.
  # Modified from https://github.com/quanteda/quanteda/pull/2296
  # Skip failing test
  patch -Np1 -i std-atomic.patch
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
