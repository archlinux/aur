# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=here
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Constructs paths to your project's files"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
	r
	"r-rprojroot>=2.0.2"
)
checkdepends=(
	r-testthat
	r-rlang
	r-uuid
	r-withr
)
optdepends=(
	r-covr
	r-conflicted
	r-fs
	r-knitr
	r-palmerpenguins
	r-plyr
	r-readr
	r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRANMIT::https://cran.r-project.org/web/licenses/MIT")
sha512sums=("7710f4c85e6c24cb4f7b24c5f904535432475a4d28e29ebe957e511bc13e8806d52f2c04583335a2a0419dcf524b4e9631d62b2e8d6bcfb2d0f018ae55cd3ba2"
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

  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm664 CRANMIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
