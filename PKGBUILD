# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
pkgver=0.12.0
pkgrel=3
epoch=
pkgdesc="A Fortran package manager and build system"
arch=('any')
url="https://fpm.fortran-lang.org/"
license=('MIT')
groups=()
depends=("git")
# makedepends=("gcc-fortran")
makedepends=("gcc12-fortran")
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
  b519b614c693dc26f553f0eb902fc707adab9d1759f17ff098412c14d6b290fe
  61567ac810d8ea8f8fc91fdb13700d34b91bf36e193b35d744fc6352d21146ad
)

prepare() {
  mkdir -p "$srcdir/${pkgname##*-}-$pkgver/_bootstrap"
  cd "$srcdir/${pkgname##*-}-$pkgver"

  mv "$srcdir/${pkgname##*-}-$pkgver.F90" "$srcdir/${pkgname##*-}-$pkgver/_bootstrap/${pkgname##*-}.F90"
}

build() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  gfortran-12 -J _bootstrap/  _bootstrap/fpm.F90 -o _bootstrap/fpm
}

check() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  # -- compile tests with gfortran 12 until bug is resolved
  export FPM_FC="$(command -v gfortran-12)"
  _bootstrap/fpm test
}

package() {
  cd "$srcdir/${pkgname##*-}-$pkgver"

  _bootstrap/fpm install --flag "-g -fbacktrace -O3" --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et :
