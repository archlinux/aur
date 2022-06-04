# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=callr
_cranver=3.7.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Call R from R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
	r
	"r-processx>=3.5.0"
	r-r6
)
checkdepends=(
	r-testthat
)
optdepends=(
	r-cli
	r-covr
	r-ps
	r-rprojroot
	r-spelling
	r-testthat
	"r-withr>=2.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
	"CRAN_MIT::https://cran.r-project.org/web/licenses/MIT")

build() {
	mkdir -p build
	R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
	if [ -d "${_cranname}/tests" ]
	then
  		cd "${_cranname}/tests"
		for i in *.R; do
			R_LIBS="${srcdir}/build" Rscript --vanilla $i
		done
	fi
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
	install -Dm644 CRAN_MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
	install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('d67255148595c6d0ba4c4d241bc9f6b5e00cafe25fdc13e38c10acc38653360a'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')
