# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-backup
pkgver=20261116005550
pkgrel=1
pkgdesc='Backup server for a BlueGit instance: incremental copy, archives, rollback'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit-backup'
license=('MIT')
makedepends=('go')
backup=('etc/bluegit-backup/config.yml')
options=('!debug')
install=bluegit-backup.install
_commit=23392bd03ee29eff276226265ba9ff1370442d1f
source=("bluegit-backup-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit-backup/-/archive/${_commit}/bluegit-backup-${_commit}.tar.gz")
sha256sums=('486fe9ad59b2b6cd0948b6357aab5793772e8c343303c0eeec8146d72be336ea')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
