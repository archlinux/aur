# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=commonmark
_cranver=1.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="High Performance CommonMark and Github Markdown Rendering in R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD)
depends=(cmark-gfm r)
checkdepends=(r-testthat r-xml2)
optdepends=(r-curl r-testthat r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "system-cmark-gfm.patch"
        "R-BSD_2_clause-TEMPLATE::https://cran.r-project.org/web/licenses/BSD_2_clause")
sha256sums=('d14a767a3ea9778d6165f44f980dd257423ca6043926e3cd8f664f7171f89108'
            '42f29d26c067e84859c90bee49613043e4425d086f430a95da6077dfc41be1b4'
            '19a23bcfa6515217ca3bd3b99c27fe425f41817a034e3279b570a60fed27c499')

prepare() {
  # build against system cmark-gfm
  cd "${_cranname}"
  patch -Np1 -i "${srcdir}/system-cmark-gfm.patch"
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

  install -Dm644 R-BSD_2_clause-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/BSD_2_clause"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
