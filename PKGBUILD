# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dockerfiler
_pkgver=0.2.3
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
md5sums=('b85e2f019a4d7f00e66186cafb4e9898'
         'ef9a524e620f31b990f6d05fa2050e0c')
b2sums=('ee5ee9e7af5270dec01f84b98d5e6e3251525f2bc0fe6d085f27b76de3ef9a65c58d73b2057c405bf4d2521c217f68654eee1e5f7f5c79bd6d80831600046729'
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
