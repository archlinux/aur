# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit
pkgver=20261022125305
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
_commit=5638c5e42b81c51e22c21fa0c9f27ee45ee15f45
source=("bluegit-${_commit}.tar.gz::https://gitlab.com/Timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('58ec5e3de69541ce9dee4ceb24e76763f5873890a5092804b91b5ad57335b771')

build() {
  cd "$srcdir/bluegit-${_commit}"
  export CGO_ENABLED=0
  export GOFLAGS='-trimpath'
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
