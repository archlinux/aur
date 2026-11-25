# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-backup
pkgver=20261125121156
pkgrel=1
pkgdesc='Backup server for a BlueGit instance: incremental copy, archives, rollback'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit'
license=('GPL-3.0-or-later')
makedepends=('go')
options=('!debug')
install=bluegit-backup.install
_commit=c5943443f25b3251a610996a22b5579c361e09d8
source=("bluegit-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('73c14de1ae383c79d7c272aec4c73950e801b968a5ccfd217c75615a75024a81')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  export GOTOOLCHAIN=auto
  export GOFLAGS='-trimpath'
  export GOCACHE="${BUILDDIR:-$srcdir}/gocache"
  export GOPATH="${BUILDDIR:-$srcdir}/gopath"
  go build -ldflags="-s -w -X gitlab.com/Timfa/bluegit/internal/backupserver/server.Version=${pkgver}" -o bluegit-backup ./cmd/bluegit-backup
}

package() {
  cd "$srcdir/bluegit-${_commit}"
  install -Dm755 bluegit-backup "$pkgdir/usr/bin/bluegit-backup"
  install -Dm644 packaging/backup/bluegit-backup.service "$pkgdir/usr/lib/systemd/system/bluegit-backup.service"
  install -Dm644 packaging/backup/sysusers.conf "$pkgdir/usr/lib/sysusers.d/bluegit-backup.conf"
  install -Dm644 packaging/backup/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/bluegit-backup.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
