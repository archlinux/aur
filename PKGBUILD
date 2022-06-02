# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=gert
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simple Git Client for R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
	r
	r-askpass
	"r-credentials>=1.2.1"
	"r-openssl>=1.4.1"
	"r-rstudioapi>=0.11"
	r-sys
	"r-zip>=2.1.0"
	"libgit2>=1.0"
)
checkdepends=(r-testthat)
optdepends=(
	r-spelling
	r-knitr
	r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
	"CRAN_MIT::https://cran.r-project.org/web/licenses/MIT")
sha512sums=("9e2c0096ca74c7c68f863a1a5e5e34432dec7f9326829d07275ca5d83e03de1f2272fca03c56f0285af068696f280f5db652939f9e347f1bf21a1645e4cfd36d"
	    "20e82bfce7b50a3adfccad5f56e13c82449da19a8dfb92f8395210dd6cf69a1962aaa114743faae02388132431d855361880b2bb26e2e30da9630a05360f42f5")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

	install -Dm644 CRAN_MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
	install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
