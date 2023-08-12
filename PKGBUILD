# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.2.1'
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
makedepends=('dart>=3.0.0' 'dart<4.0.0')
_pkgdir='podman_backup-1.2.1'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.2.1.tar.gz")
b2sums=('109b6ba5d5a9eb46ce05800df2c6c9025b8d37d68ec7528d381337d2e562f7184fcef1530df95eb9d65d60c8f146819d16c837299aad520da6873f9546c2eb02')
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

