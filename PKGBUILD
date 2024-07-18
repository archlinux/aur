# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cubble
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Vector Spatio-Temporal Data Structure for Data Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
        "fix-tests.patch")
md5sums=('b1a93ce76428df673674ac8a3ff853cb'
         '17ad8728b51d3c54b73045a92dfeed49')
b2sums=('7cbd7dc0a859dc1ea7e9acb54a8ba7845922cbe77972c24f1d828f5bc1a92ae3f07da6304a94e6600f0026e67199d63dbac277ad57e289227e8822d2e3396b24'
        '9a0b54584f836fcaf883e071dddbca63c0bc17eb85ce9f9b62d4ce2c8db42fe3aac3549ed9f87627f5fd1a2daa3ade2408e79cee258a3066b86500787af26f14')

prepare() {
  # skip tests depending on r-stars
  patch -Np1 -i fix-tests.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
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
