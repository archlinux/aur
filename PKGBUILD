# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit
pkgver=20261023073152
pkgrel=1
pkgdesc='Self-hosted git-platform'
arch=('x86_64')
url='https://gitlab.com/Timfa/bluegit'
license=('MIT')
depends=('git' 'docker')
makedepends=('go')
backup=('etc/bluegit/config.yml')
options=('!debug')
install=bluegit.install
_commit=6f0cc3ef9ef956a659ee192af269e3577228bcbb
source=("bluegit-${_commit}.tar.gz::https://gitlab.com/Timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('becae6485cfd8ab505889e78830af47d6c54503e04a9491290c08f150d1183e5')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  export GOFLAGS='-trimpath'
  # De geïnstalleerde updater zet HOME op /var/lib/bluegit-build. Die map
  # bestaat pas na tmpfiles, dus deze bouw mag daar niet schrijven.
  export GOCACHE="${BUILDDIR:-$srcdir}/gocache"
  export GOPATH="${BUILDDIR:-$srcdir}/gopath"
  go build -ldflags='-s -w' -o bluegit ./cmd/bluegit
}

package() {
  cd "$srcdir/bluegit-${_commit}"
  install -Dm755 bluegit "$pkgdir/usr/bin/bluegit"
  install -Dm644 packaging/bluegit.service "$pkgdir/usr/lib/systemd/system/bluegit.service"
  install -Dm644 packaging/bluegit.yml "$pkgdir/etc/bluegit/config.yml"
  install -Dm644 packaging/storage.conf "$pkgdir/usr/share/bluegit/storage.conf.example"
  install -Dm644 packaging/sysusers.conf "$pkgdir/usr/lib/sysusers.d/bluegit.conf"
  install -Dm644 packaging/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/bluegit.conf"
  install -Dm755 packaging/bluegit-update.sh "$pkgdir/usr/lib/bluegit/update"
  install -Dm644 packaging/bluegit-update.service "$pkgdir/usr/lib/systemd/system/bluegit-update.service"
  install -Dm644 packaging/bluegit-update.rules "$pkgdir/usr/share/polkit-1/rules.d/49-bluegit-update.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
