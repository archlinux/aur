# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dockerfiler
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easy Dockerfile Creation from R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-attempt
  r-cli
  r-desc
  r-fs
  r-glue
  r-jsonlite
  r-memoise
  r-pak
  r-pkgbuild
  r-purrr
  r-r6
  r-remotes
  r-usethis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('956170e9e496722508407c9a134dcb11'
         'ef9a524e620f31b990f6d05fa2050e0c')
b2sums=('4b6eedecc8fa69e32446940d9a9ecae54e925d691e4b4307720e933f969cd4a05f16fbb7e880e8a03fadf118afb3fa4e55e45a7f1e692d193efb77a423d66ba3'
        '0ca7924504a7f0e809afc72d09fae390710ec233078354b710dfb2ed1c1db849bcb19b496ad26182200bfd7b7659e6531ad4bcdf4c1660459ab7cb2425e3eb51')

prepare() {
  # skip failing tests
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
