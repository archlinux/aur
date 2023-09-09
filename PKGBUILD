# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gganimate
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="A Grammar of Animated Graphics"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-ggplot2
  r-glue
  r-progress
  r-rlang
  r-scales
  r-stringi
  r-tweenr
)
checkdepends=(
  r-gifski
  r-magick
  r-testthat
  r-transformr
  ttf-font
)
optdepends=(
  r-av
  r-base64enc
  r-covr
  r-gifski
  r-htmltools
  r-knitr
  r-magick
  r-ragg
  r-rmarkdown
  r-svglite
  r-testthat
  r-transformr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ec08a5316dfd4d845238dfb296e2b91')
sha256sums=('a12d865ddecea761e8f12bdc3bfdb78642f7ab2d53b78940e1290c9071d24bc9')

prepare() {
  # Skip test until upstream fixes the bug
  # https://github.com/thomasp85/gganimate/commit/1193080105062a4259be0da085d0f26aca0f20c2
  # https://github.com/thomasp85/gganimate/issues/287
  # https://github.com/thomasp85/gganimate/issues/447
  sed -i '/contour works/a\ \ skip("Upstream bug #287")' \
      "$_pkgname/tests/testthat/test-transition-states.R"
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
