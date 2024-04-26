# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cubble
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
        "enable-tests.patch")
md5sums=('507beb3acc1807759c2f7cd7a1ab776b'
         'e2b8a5680c7d062c94e3e483d68cd8e8')
b2sums=('36484c35e063e59426a2cce4cca06c77c19f4c158473938421f93370d5f7c27f61cd1f60e118e6a5408d2d6e0be78e8ae85dd5b4b198e41e58c2e2837c9c3093'
        'c26254ed7877e0693784ee5a43f391548c105f56c7f3d765bb78476e7e07e0c128173b2bfc3256ab453049e6dec280745565d9619a1df5440dea371fca9ea199')

prepare() {
  # enable tests
  patch -Np1 -i enable-tests.patch
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
