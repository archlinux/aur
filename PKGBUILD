# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Symphony integer linear programming solver in R"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(EPL)
depends=(
  coin-or-symphony
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-symphony.patch")
md5sums=('106ec54272f27574ea1eea2d5721d7e4'
         '5fe82566bce5f45a9d9d8682e51ebfaa')
sha256sums=('ef2c03a596981da910697dab15672bce91a267a459e89c526bddef9f38e586a4'
            'e4ffaac1444e128a63ba43d0adbd3dd8b6acac0ca5e8b2d8fe43ab3ffcb92e5a')

prepare() {
  # build against system SYMPHONY
  patch -Np1 -i system-symphony.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
