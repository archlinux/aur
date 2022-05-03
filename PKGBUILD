# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Deian Stefan

_pkgname=boolector
pkgname=boolector-git
pkgver=3.2.2.r18.g1a89c229
pkgrel=1
pkgdesc="A Satisfiability Modulo Theories (SMT) solver for the theories of fixed-size bit-vectors, arrays and uninterpreted functions"
arch=('x86_64')
url="https://github.com/Boolector/boolector"
license=('MIT')
depends=('btor2tools-git')
makedepends=('git' 'cmake' 'lingeling' 'gtest')
checkdepends=('python')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=on \
    -DTESTING=on
  make -C build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 "$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim: set et ts=2:
