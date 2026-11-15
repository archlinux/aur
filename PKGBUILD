# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-backup
pkgver=20261115135704
pkgrel=1
pkgdesc='Backup server for a BlueGit instance: incremental copy, archives, rollback'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit-backup'
license=('MIT')
depends=('curl')
makedepends=('go')
backup=('etc/bluegit-backup/config.yml')
options=('!debug')
install=bluegit-backup.install
_commit=04234ca37b53a9bd293f4ac0aae81c1268cfed01
source=("bluegit-backup-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit-backup/-/archive/${_commit}/bluegit-backup-${_commit}.tar.gz")
sha256sums=('ee18a8c0bae22d26ef7868b2835ca92fa990f4acab1ab02895cd003a29cc3bab')

build() {
  cd "$srcdir/bluegit-backup-${_commit}"
  export CGO_ENABLED=0
  export GOTOOLCHAIN=auto
  export GOFLAGS='-trimpath'
  export GOCACHE="${BUILDDIR:-$srcdir}/gocache"
  export GOPATH="${BUILDDIR:-$srcdir}/gopath"
  go build -ldflags="-s -w -X git.timfalken.com/timfa/bluegit-backup/internal/server.Version=${pkgver}" -o bluegit-backup ./cmd/bluegit-backup
}

package() {
  cd "$srcdir/bluegit-backup-${_commit}"
  install -Dm755 bluegit-backup "$pkgdir/usr/bin/bluegit-backup"
  install -Dm644 packaging/bluegit-backup.service "$pkgdir/usr/lib/systemd/system/bluegit-backup.service"
  install -Dm644 packaging/config.yml "$pkgdir/etc/bluegit-backup/config.yml"
  install -Dm644 packaging/sysusers.conf "$pkgdir/usr/lib/sysusers.d/bluegit-backup.conf"
  install -Dm644 packaging/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/bluegit-backup.conf"
  install -Dm755 packaging/bluegit-backup-update.sh "$pkgdir/usr/lib/bluegit-backup/update"
  install -Dm644 packaging/bluegit-backup-update.service "$pkgdir/usr/lib/systemd/system/bluegit-backup-update.service"
  install -Dm644 packaging/bluegit-backup-update.rules "$pkgdir/usr/share/polkit-1/rules.d/49-bluegit-backup-update.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
