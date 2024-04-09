# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=bspm
_pkgver=0.5.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bridge to System Package Manager"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
md5sums=('5c14be37758643b7f291ebabce670649'
         '36f5173c5c892c7c525ff320f99952ab')
b2sums=('5ce4e6024c882a7a301d863edd7b6c5e7c6733c88894fecadc6f552f8bb48ee072bc85bc51d05e131bc2d5bb0fe30d24254faae905b6781a17a7981c5f649800'
        '82a8ebbdd7806619c4e03ec9c5f27515bc8589d75588a3e3fe45318bd6df4f549547b19ba5d69a6ebb0f8bcfe7cb9b2679738057dbbe7c4c2617271ef1548946')

prepare() {
  # fix dbus configuration
  patch -Np1 -i fix-dbus.patch
}

build() {
  mkdir build dbus
  R CMD INSTALL -l build "$_pkgname" \
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
