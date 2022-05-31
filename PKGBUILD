# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=feather
_cranver=0.3.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Read and write feather files, a lightweight binary columnar data store designed for maximum speed."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache-2.0)
depends=(
    r-rcpp
    'r-tibble>=2.0.0'
    r-hms
)
checkdepends=(
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "APACHE::https://www.apache.org/licenses/LICENSE-2.0.txt")
sha512sums=("6343e06f2e05dd61d615cf00ef6045053ebf2e4a4237f417d798eedb41cb244d9bec373500580ce79d6a2093bef83798c723d00a1fc5ba4e7082c3ea698521ac"
	   "98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8")

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

  install -Dm644 APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
