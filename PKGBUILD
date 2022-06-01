# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=languageserver
_cranver=0.3.13
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol for R. The Language Server protocol is used by an editor client to integrate features like auto completion. See <https://microsoft.github.io/language-server-protocol/> for details."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    "r-callr>=3.0.0"
    "r-collections>=0.3.0"
    "r-fs>=1.3.1"
    "r-jsonlite>=1.6"
    "r-lintr>=2.0.1"
    r-parallel
    "r-r6>=2.4.1"
    "r-roxygen2>=7.0.0"
    "r-stringi>=1.1.7"
    "r-styler>=1.5.1"
    "r-xml2>=1.2.2"
    "r-xmlparsedata>=1.0.3"
)
checkdepends=(
    "r-covr>=3.4.0"
    "r-magrittr>=1.5"
    "r-mockery>=0.4.2"
    "r-processx>=3.4.1"
    "r-purrr>=0.3.3"
    "r-testthat>=2.1.0"
    "r-withr>=2.3.0"
    "r-rmarkdown>=2.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRANMITTEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha512sums=("12e22e06329d2e0a584f2e08b2a688d0d3fc4c1c95a5197b148503241cb4ae176c80dd5be36340347d7f4f25f03946d0177e8703de0f8fe8bd4de273b96d0317"
	   "20e82bfce7b50a3adfccad5f56e13c82449da19a8dfb92f8395210dd6cf69a1962aaa114743faae02388132431d855361880b2bb26e2e30da9630a05360f42f5")

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

  install -Dm644 CRANMITTEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
