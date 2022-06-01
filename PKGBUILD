# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=styler
_cranver=1.7.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Pretty-prints R code without changing the user's formatting intent."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    "r>=3.4.0"
    "r-cli>=3.1.1"
    "r-magrittr>=2.0.0"
    "r-purrr>=0.2.3"
    "r-r.cache>=0.15.0"
    "r-rematch2>=2.0.1"
    "r-rlang>=0.1.1"
    "r-rprojroot>=1.1"
    "r-tibble>=1.4.2"
    "r-withr>=1.0.0"
)
checkdepends=(
    "r-testthat>=2.1.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRANMITTEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha512sums=("f7b64199154a9d9a4d7479fc31b9cbc62f62bd9a568a202b08ae849b4a34b4f3f878c6ed3448db08290b6d45d6ea1043cd92835b9a31579e9f1b171e53db839e"
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
