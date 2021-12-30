# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=ps
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="List, Query, Manipulate System Processes"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r)
checkdepends=(
    procps-ng
    r-curl
    r-pingr
    r-testthat
    socat
)
optdepends=(
    r-callr
    r-covr
    r-curl
    r-pingr
    r-processx
    r-r6
    r-rlang
    r-testthat
    r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "R-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('89ad7ddc5e0818bccacfd0673ddf2da0892ac2a3b4d3a821e40884ab1e96bf31'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

prepare() {
  # pass LDFLAGS to linker when linking px binary to enable RELRO
  sed -i 's/-o px/-o px $(LDFLAGS)/' "${_cranname}/src/Makevars.in"
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true R --vanilla -q -f testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 R-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
