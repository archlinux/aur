# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.0.1'
pkgrel=1
epoch=2
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.17.0' 'dart<3.0.0')
_pkgdir='paxchange-1.0.1'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.0.1.tar.gz")
b2sums=('6132b0088e48584ff757650ec66205b533b4c528d8c36deb8f73f71ce4bfa794f8851c3f6d63f09074ab8746a8f54d59fcda40f1c9772ed1a3cf9f717d3fb8da')
install='paxchange.install'
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
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

