# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm
pkgver=0.14.0
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
sha256sums=('80d4caa2438ab68794685ad18e46605beef0d44beb4c7c3f34de7c14a4fde40e'
            'a620bbb6dcb6f704badb63dd0d3b944fd437b3a8e2e4e3acd54ac23ea06bd81b')

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
