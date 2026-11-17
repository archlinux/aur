# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit-backup
pkgver=20261117083310
pkgrel=1
pkgdesc='Backup server for a BlueGit instance: incremental copy, archives, rollback'
arch=('x86_64' 'aarch64')
url='https://git.timfalken.com/timfa/bluegit'
license=('MIT')
makedepends=('go')
backup=('etc/bluegit-backup/config.yml')
options=('!debug')
install=bluegit-backup.install
_commit=8bb15b294407fb15f5c0acceb0d6914e20e9a828
source=("bluegit-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('0020ecb84a63a3d22a51793b32da09ea23ca74c42da97629215289134bdd23f4')

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
  install -Dm644 packaging/backup/config.yml "$pkgdir/etc/bluegit-backup/config.yml"
  install -Dm644 packaging/backup/sysusers.conf "$pkgdir/usr/lib/sysusers.d/bluegit-backup.conf"
  install -Dm644 packaging/backup/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/bluegit-backup.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
