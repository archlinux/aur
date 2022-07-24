# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='pacsync'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/pacsync'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.17.0' 'dart<3.0.0' 'go-yq')
_pkgdir="$pkgname-${pkgver//_/-}"
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/pacsync/archive/refs/tags/v0.1.0.tar.gz")
changelog='CHANGELOG.md'
b2sums=('01ae910bd60d1abd83a2acc3231fe5121f2fefa169eb51b7ae051ab1a029bb646384cdc34a29473257f8782805b8e3aa6a960ee3881cb18de0d39bd6b8c25367')

prepare() {
  cd "$_pkgdir"
  yq e -i "del(.dependency_overrides)" pubspec.yaml
  dart pub get
}

build() {
  cd "$_pkgdir"
  dart run build_runner build --delete-conflicting-outputs --release
  dart compile exe -o 'bin/pacsync' -S 'bin/pacsync.symbols' 'bin/pacsync.dart'
}

check() {
  cd "$_pkgdir"
  dart analyze --no-fatal-warnings
  # dart test
}

package() {
  cd "$_pkgdir"
  install -D -m755 'bin/pacsync' "$pkgdir"'/usr/bin/pacsync'
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
