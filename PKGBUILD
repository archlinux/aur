# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
pkgver=0.11.0
pkgrel=1
epoch=
pkgdesc="A Fortran package manager and build system"
arch=('any')
url="https://fpm.fortran-lang.org/"
license=('MIT')
groups=()
depends=("git")
makedepends=("gcc-fortran")
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname##*-}" "${pkgname}-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fortran-lang/fpm/releases/download/v$pkgver/${pkgname##*-}-$pkgver.zip"
        "https://github.com/fortran-lang/fpm/releases/download/v$pkgver/"${pkgname##*-}-$pkgver.F90)
noextract=()
sha256sums=(
  f6c998c9afd39eb42c7e80a306cfbed5faa77eaa42eb4f75b93864c338db1795
  988a3317ee2448ee7207d0a29410f08a79c86bddac3314b2a175801a9cf58d27
)

prepare() {
  mkdir -p "$srcdir/${pkgname##*-}-$pkgver/_bootstrap"
  cd "$srcdir/${pkgname##*-}-$pkgver"

  mv "$srcdir/${pkgname##*-}-$pkgver.F90" "$srcdir/${pkgname##*-}-$pkgver/_bootstrap/${pkgname##*-}.F90"
}

build() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  gfortran -J _bootstrap/  _bootstrap/fpm.F90 -o _bootstrap/fpm
}

check() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  _bootstrap/fpm test
}

package() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  _bootstrap/fpm install --flag "-g -fbacktrace -O3" --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et :
