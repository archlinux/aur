# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
_name=fpm
pkgver=0.9.0
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
conflicts=("${_name}" "${pkgname}-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fortran-lang/fpm/releases/download/v$pkgver/$_name-$pkgver.zip"
        "https://github.com/fortran-lang/fpm/releases/download/v$pkgver/"$_name-$pkgver.F90)
noextract=()
sha256sums=(
  "484debabd7d22186ac41f865ddf63475c279a61a51aaff5636ed615860b5b8d7"
  "556b3883ba1db6fd62c99ba7143f1e97ebb409729c4209f03aa3c6fc970cce3f"
)

prepare() {
  mkdir -p "$srcdir/$_name-$pkgver/_bootstrap"
  cd "$srcdir/$_name-$pkgver"

  mv "$srcdir/$_name-$pkgver.F90" "$srcdir/$_name-$pkgver/_bootstrap/$_name.F90"
}

build() {
  cd "$srcdir/$_name-$pkgver"

  gfortran -J _bootstrap/  _bootstrap/fpm.F90 -o _bootstrap/fpm
}

check() {
  cd "$srcdir/$_name-$pkgver"

  _bootstrap/fpm test
}

package() {
  cd "$srcdir/$_name-$pkgver"

  _bootstrap/fpm install --flag "-g -fbacktrace -O3" --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et :
