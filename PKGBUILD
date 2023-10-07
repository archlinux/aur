# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=bspm
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bridge to System Package Manager"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  gobject-introspection-runtime
  pyalpm
  python-dbus
  python-gobject
  r
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-dbus.patch")
md5sums=('86d4bc20c4b90d6d61873e554e0a20f4'
         '36f5173c5c892c7c525ff320f99952ab')
sha256sums=('d49d91ec3e0caaf698596a17ce391dafc146b9cfa0f8ce5183b1ef41d142a61d'
            '7a80496e502ddab4f4682e791b626b0a2ccb405ee2c138a0932cd112b86987c0')

prepare() {
  # fix dbus configuration
  patch -Np1 -i fix-dbus.patch
}

build() {
  mkdir -p build dbus
  R CMD INSTALL "$_pkgname" -l build \
      --configure-vars="BUILD_ROOT=$srcdir/dbus"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  # install dbus config
  cp -r dbus/usr "$pkgdir"

  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
