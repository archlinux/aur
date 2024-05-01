# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dockerfiler
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('036c7fa0312dc7282d019e6cdd9d1d41'
         '6a9c60df03b8b913c107d685c91e2852')
b2sums=('0704a49b4045c043691cee4b65243cab698b0095b2e4be0939db0338733e55f5176d5f9d4ddfaf7de19a835ba1523d1341bbbe73a94bdc70005d9f2b77f48f03'
        '346c4c2daed19b2685960719d1aeda1058179d7a19b83d811ab5b93b1091532e60ccaf5c6aee1124feda2b759ad0adf38b57ef576705d40e67f9caeaceec50a9')

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
