# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgver='0.1.0'
pkgrel='1'
epoch=2
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.17.0' 'dart<3.0.0' 'go-yq')
_pkgdir="$pkgname-${pkgver//_/-}"
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v0.1.0.tar.gz")
changelog='CHANGELOG.md'
b2sums=('c029cfdf7307d2758af4ba2222ca1ba7910e18f59416aa65e70b2f09354c02936947ed624ce3415423a085d77af577f43f8ea40e46fe45cf5994c9bba13c1621')

prepare() {
  cd "$_pkgdir"
  yq e -i "del(.dependency_overrides)" pubspec.yaml
  dart pub get
}

build() {
  cd "$_pkgdir"
  dart run build_runner build --delete-conflicting-outputs --release
  dart compile exe -o 'bin/paxchange' -S 'bin/paxchange.symbols' 'bin/paxchange.dart'
}

check() {
  cd "$_pkgdir"
  dart analyze --no-fatal-warnings
  # dart test
}

package() {
  cd "$_pkgdir"
  install -D -m755 'bin/paxchange' "$pkgdir"'/usr/bin/paxchange'
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
