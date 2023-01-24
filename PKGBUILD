# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=yaml
_cranver=2.3.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Methods to Convert R Data to YAML and Back"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD)
depends=(r)
makedepends=(re2c)
checkdepends=(r-runit)
optdepends=(r-runit)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-BSD_3_clause-TEMPLATE::https://cran.r-project.org/web/licenses/BSD_3_clause")
sha256sums=('d20cb219e0f9c48aba02f132f81cfa9ecda5e22c925e36726840218ed56680ab'
            '07ff367bbf4b36ad86223c722d0798a3cdd0b5b03347fa724d82cc108e324929')

build() {
  # generate implicit tag discovery code
  re2c -o "${_cranname}/src/implicit.c" --no-generation-date "${_cranname}/inst/implicit.re"

  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" Rscript --vanilla RUnit.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRAN-BSD_3_clause-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/BSD_3_clause"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
