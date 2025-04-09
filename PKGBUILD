# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=pak
_pkgver=0.8.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Another Approach to Package Installation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-callr
  r-cli
  r-curl
  r-desc
  r-filelock
  r-jsonlite
  r-lpsolve
  r-pkgbuild
  r-pkgcache
  r-pkgdepends
  r-pkgsearch
  r-processx
  r-ps
  r-r6
  r-zip
)
checkdepends=(
  r-mockery
  r-testthat
)
optdepends=(
  r-covr
  r-gitcreds
  r-glue
  r-mockery
  r-pingr
  r-pkgload
  r-rstudioapi
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('dff734c1b69ff2bbc8302efa4e8dfdb9'
         '29b1470e2d25f82ebeafc02fe3b2594a')
b2sums=('0c7d639f521777264c9f55f74d833acf676c5633bc5ebeaf8a53e29861d4542d5f7df6e7dd5cfefd68d8304e1a090a401595d08a7989bbee91efd211a87f4ece'
        'b422c6a23d6850831433fdcf3e81684189bdaea1735fcc85edeff3202fe084f4167876949ff9ddfd5654cb2ce202ed005800a217dfe9bb12fb8240456880b4f1')

prepare() {
  # devendor R dependencies
  patch -Np1 -i system-libs.patch
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
