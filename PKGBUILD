# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=gganimate
_cranver=1.0.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Grammar of Animated Graphics"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    r-ggplot2
    r-stringi
    r-tweenr
    r-rlang
    r-glue
    r-progress
    r-scales
)
checkdepends=(r-magick r-testthat r-transformr)
optdepends=(
    r-magick
    r-svglite
    r-knitr
    r-rmarkdown
    r-testthat
    r-base64enc
    r-htmltools
    r-covr
    r-transformr
    r-av
    r-gifski
    r-ragg
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('a12d865ddecea761e8f12bdc3bfdb78642f7ab2d53b78940e1290c9071d24bc9'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

prepare() {
  # Skip test until upstream fixes the bug
  # https://github.com/thomasp85/gganimate/commit/1193080105062a4259be0da085d0f26aca0f20c2
  # https://github.com/thomasp85/gganimate/issues/287
  # https://github.com/thomasp85/gganimate/issues/447
  sed -i '/contour works/a\ \ skip("Upstream bug #287")' \
      "${_cranname}/tests/testthat/test-transition-states.R"
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

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
