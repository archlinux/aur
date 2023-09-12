# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cubble
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Vector Spatio-Temporal Data Structure for Data Analysis"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-cli
  r-dplyr
  r-ggplot2
  r-glue
  r-lubridate
  r-ncdf4
  r-rlang
  r-sf
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-tsibble
  r-vctrs
)
checkdepends=(
  r-ggally
  r-testthat
  r-vdiffr
)
optdepends=(
  r-colorspace
  r-concaveman
  r-crosstalk
  r-ggally
  r-ggforce
  r-ggrepel
  r-knitr
  r-leaflet
  r-ozmaps
  r-patchwork
  r-plotly
  r-purrr
  r-rmarkdown
  r-sftime
  r-spelling
  r-stars
  r-testthat
  r-units
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "enable-tests.patch")
md5sums=('507beb3acc1807759c2f7cd7a1ab776b'
         'e2b8a5680c7d062c94e3e483d68cd8e8')
sha256sums=('bb7c4834b155e1351dc5810eb058237d659ab025f85bb5f8ce02a212fdf94d4a'
            '528beb5ae73cf616562440024e0b84250a2e02e01d50084ea5ff345cbe3076cb')

prepare() {
  # enable tests
  patch -Np1 -i enable-tests.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
