# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=bspm
_pkgver=0.5.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bridge to System Package Manager"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  glib2
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
install=r-bspm.install
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-dbus.patch")
md5sums=('b37d1d98def7babffabf84a52a19aebe'
         'b9264c2d1a89b4947b739ed62c7b2594')
b2sums=('a35c3124d2afd0943daf97fc00c70c4f8b749962334c92a071a3808cf404589ae1b1b8ec4bfdf5152b77b1f94dd1a2d32314eaceab9c51ed0ee4ef031201e453'
        'aa3a49c162c04e0600003dda3eb0b6920719df16b368b707a3e055aecfd9204d2e90f844965f685ff31c769f8066d2140e4d1b259d1765e30aeb4a0ab5ce54a6')

prepare() {
  # fix dbus configuration
  patch -Np1 -i fix-dbus.patch
}

build() {
  mkdir build dbus
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars="BUILD_ROOT=${srcdir@Q}/dbus"

  # compile python bytecode
  python -m compileall -o 0 -o 1 -s build -p /usr/lib/R/library "build/$_pkgname/service"
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
