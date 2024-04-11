# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GetoptLong
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Parsing Command-Line Arguments and Simple Variable Interpolation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  perl-json
  perl-json-xs
  perl-yaml-syck
  r-crayon
  r-globaloptions
  r-rjson
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('859f5b437ccf1eda9fe0e99eb80b2def'
         '2973d9109d39fe8fb5f1d3b93b7cb481')
b2sums=('e33d5c05f4a597144881cefdfcc1c96698136de1559797ac58a0e4f16cf92498e41407d3675fdebafef205379d17fba76f3354c25bbe509444c0afd0dc4e6b59'
        'fa9093742756bbc717c4702230155ff18358d209aa04bdce99940f717e19acdfe64bbfd5a46c7f9bda6ca767a376d5b9388c8c6029352ed27e2c539a4387e22d')

prepare() {
  # fix tests
  patch -Np1 -i fix-tests.patch

  # use system perl modules
  cd "$_pkgname/inst/extdata"
  rm -r perl_lib
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true GETOPTLONG_TESTING=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
