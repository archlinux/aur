# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

_pkgname=unix
_pkgver=1.5.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="POSIX System Utilities"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  apparmor
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea966ea9fb4f59ef99cb6cfa09432fa7')
sha256sums=('576172d667598245413374121bdcefe6445773aedbb6ce3baf0be2ad5a9a19b9')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
      --configure-vars=FORCE_APPARMOR=1
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
