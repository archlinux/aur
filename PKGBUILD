# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
pkgver=0.13.0
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
provides=("fortran-fpm")
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
  2c81b448efe9f6a93f4c3cfd7131a42249cd611121857f2bae15b8e2d69ff9a7
  001cff6cf1145f215baa0888ba27acc06cea30a89b79d1a8be97db3fffbc8cd2
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
