# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.0.0'
pkgrel=1
epoch=2
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.17.0' 'dart<3.0.0')
_pkgdir='paxchange-1.0.0'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.0.0.tar.gz")
b2sums=('0d9ba738502f3e6e6483a5438251d332e97883a08c840e6043831f8b16d85f12793eefe3db8a3d336ccaaa989580381c20a34ef36c67593a8fc98d701164fd71')
changelog='CHANGELOG.md'
backup=('etc/paxchange.json')
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
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

