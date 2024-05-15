# Maintainer:

_pkgname="fvm"
pkgname="$_pkgname-git"
pkgver=3.1.4.r2.g3cad095
pkgrel=1
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions"
url="https://github.com/leoafarias/fvm"
license=('MIT')
arch=('x86_64')

depends=(
  'git'
  'unzip'
)
makedepends=(
  'dart'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=(!strip !debug)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  dart pub upgrade
}
build() {
  cd "$_pkgsrc"
  dart compile exe -o bin/fvm bin/main.dart
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "bin/fvm" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
