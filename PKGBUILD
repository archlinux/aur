# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
pkgver=0.10.1
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
  dd97b3b61f2ec8a7ea7a2a588920097f513f74ff8b1a12531074dad07c81dc6c
  7553d05b60c2a7e889a23ba10a0784155169ba01bfc7e0ca846f7ce90b84e1ca

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
