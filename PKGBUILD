# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A sample command-line application.'
pkgver='1.0.1'
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
makedepends=('dart>=2.19.0' 'dart<3.0.0')
_pkgdir='podman_backup-1.0.1'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.0.1.tar.gz")
b2sums=('31e396eee5909cae656e00eb985053e2c54463bf00ec6305412f3e8bae4f712308e5d151478dfd54b79efa9928a5f37622417d97a372a190663d7630d3801a1f')
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

