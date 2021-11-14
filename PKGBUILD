# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=fortran-fpm
_pkgname=fpm
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A Fortran package manager and build system"
arch=('x86_64')
url="https://github.com/fortran-lang/fpm"
license=('MIT')
groups=()
depends=("git")
makedepends=("gcc-fortran")
checkdepends=()
optdepends=()
provides=()
conflicts=("fpm")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fortran-lang/fpm/releases/download/v$pkgver/$_pkgname-$pkgver.zip"
        "https://github.com/fortran-lang/fpm/releases/download/v$pkgver/"$_pkgname-$pkgver.F90)
sha256sums=('cd9b80b7f40d9cf357ca8d5d4fe289fd32dfccb729bad7d2a68f245e4cdd0045'
            'f69c18364e43ca1ef69e19f44c28e2929e30c1b33d78821db96da49f086963f9')
noextract=()

prepare() {
  mkdir -p "$srcdir/$_pkgname-$pkgver/_bootstrap"
  cd "$srcdir/$_pkgname-$pkgver"

  mv "$srcdir/$_pkgname-$pkgver.F90" "$srcdir/$_pkgname-$pkgver/_bootstrap/$_pkgname.F90"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  gfortran -J _bootstrap/  _bootstrap/fpm.F90 -o _bootstrap/fpm
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  _bootstrap/fpm test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  _bootstrap/fpm install --flag "-g -fbacktrace -O3" --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
