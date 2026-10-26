# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit
pkgver=20261025234544
pkgrel=1
pkgdesc='Self-hosted git-platform'
arch=('x86_64')
url='https://git.timfalken.com/timfa/bluegit'
license=('MIT')
depends=('git' 'docker')
makedepends=('go')
backup=('etc/bluegit/config.yml')
options=('!debug')
install=bluegit.install
_commit=f6236bc3cfc31581b17a1e0b0bb7148ba5189f41
source=("bluegit-${_commit}.tar.gz::https://git.timfalken.com/timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('d0e39f2d54c1488e0848d23748575857998b7cbc90c7600f1aba2b30622e07b6')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  # go.mod vraagt Go 1.26; een oudere Arch-go haalt die toolchain zelf op.
  export GOTOOLCHAIN=auto
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
