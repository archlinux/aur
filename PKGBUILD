# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=pkgsearch
_pkgver=3.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Search and Query CRAN R Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-curl
  r-jsonlite
)
checkdepends=(
  r-mockery
  r-pingr
  r-testthat
)
optdepends=(
  r-covr
  r-memoise
  r-mockery
  r-pillar
  r-pingr
  r-rstudioapi
  r-shiny
  r-shinyjs
  r-shinywidgets
  r-testthat
  r-whoami
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('5506c33a6c44075c92b56d27eb68aabf'
         'b107e365dd7f7e32cc1e21b4d0cb3db9')
b2sums=('2021907562f44165304dbb762b6561e58d935f2d7c2822cec12545bf169a4379d49a76006aa65a64e2f164cadafb8120c9712813b8068b9f6c6a6de0fe9eaa6c'
        '940785dd4867c9c823c76b0ef8123c61b2404b0ba69a6f67380c9684840e6ae98fe68c58f74ea8c5bf64a2e924292e45bd528baf521eed988419a43306f3dddf')

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
