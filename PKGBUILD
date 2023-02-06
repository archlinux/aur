# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.2.2'
pkgrel=1
epoch=2
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
makedepends=('dart>=2.19.0' 'dart<3.0.0')
_pkgdir='paxchange-1.2.2'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.2.2.tar.gz")
b2sums=('b92effc9a325ba2b2cf3a3f009d7c5ad09995878ccc1fe0614d81f5431e7750082ea976f6029abcac2d9879fce120e5e498d62b4558cfe33d810969b9dc7dfb0')
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
  dart test --preset unit
}

package() {
  cd "$_pkgdir"
  install -D -m755 'bin/paxchange' "$pkgdir/usr/bin/"'paxchange'
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

