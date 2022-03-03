# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=lobstr
_cranver=1.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualize R Data Structures with Trees"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r-crayon r-rcpp r-rlang)
checkdepends=(r-testthat)
optdepends=(
    r-covr
    r-pillar
    r-pkgdown
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b8c9ce00095bd4f304b4883ef71da24572022f0632a18c3e1ba317814e70716e')

prepare() {
  # Fix test
  sed -i '10 s/<list>/<named list>/' \
      "${_cranname}/tests/testthat/test-ref-list.txt"
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
