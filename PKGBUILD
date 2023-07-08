# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.0.3'
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
makedepends=('dart>=3.0.0' 'dart<4.0.0')
_pkgdir='podman_backup-1.0.3'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.0.3.tar.gz")
b2sums=('445b4106beceb255644ed8394551513e60098ada8a2a62e5c608797b44c69a16560f6c6bda27d101253341b25fe97faadc97a285ed05aba853e0ee0872e60fa5')
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

