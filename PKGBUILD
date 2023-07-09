# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.0.4'
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
makedepends=('dart>=3.0.0' 'dart<4.0.0')
_pkgdir='podman_backup-1.0.4'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.0.4.tar.gz")
b2sums=('0c0579f0075648fd9289fea197859d16a77e17f4ff5d1f3222a8f3cd370c4c6dd4f8f939613adb8bc7c9c9404b9b6daa53ee14a81e3d47e6bea5d58a4bdc5d79')
changelog='CHANGELOG.md'
options=('!strip')

prepare() {
  cd "$_pkgdir"
  dart pub get
}

build() {
  cd "$_pkgdir"
  dart run build_runner build --delete-conflicting-outputs --release
  dart compile exe -o 'bin/podman-backup' -S 'bin/podman-backup.symbols' 'bin/podman_backup.dart'
}

check() {
  cd "$_pkgdir"
  dart analyze --no-fatal-warnings
  dart test --preset unit
}

package() {
  cd "$_pkgdir"
  install -D -m755 'bin/podman-backup' "$pkgdir/usr/bin/"'podman-backup'
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

