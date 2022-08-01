# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='0.1.2'
pkgrel=1
epoch=2
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.17.0' 'dart<3.0.0')
_pkgdir='paxchange-0.1.2'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v0.1.2.tar.gz")
b2sums=('814b80df62a4af65c68ba4c0eba675030c637d284aba5e9f101ec087005a96e0fcbf350b2387b480e91a5941cb6abff2035b483338596b8a7144ab57cbd6e54c')
changelog='CHANGELOG.md'
options=('!strip')

prepare() {
  cd "$_pkgdir"
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
  dart test
}

package() {
  cd "$_pkgdir"
  install -D -m755 'bin/paxchange' "$pkgdir/usr/bin/"'paxchange'
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

