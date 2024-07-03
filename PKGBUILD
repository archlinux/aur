# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cubble
_pkgver=0.3.1
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
md5sums=('dfa7f2f0eaf7caace20bef962832ac7b'
         '17ad8728b51d3c54b73045a92dfeed49')
b2sums=('8ab27717cc994b2cc93ea841ec11452fb2613790cec3e73b921b83d927de0ec738eac295886968d2d45d793e0b0c80ff96c564af9b7194745498ae68ad8678c0'
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
