# Maintainer: Tim Falken <tim@timfalken.com>
pkgname=bluegit
pkgver=20261022223233
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
_commit=22c95bf52c4bd4aaab4415bcf13093f3c9958816
source=("bluegit-${_commit}.tar.gz::https://gitlab.com/Timfa/bluegit/-/archive/${_commit}/bluegit-${_commit}.tar.gz")
sha256sums=('e1640448d97b2b8ad6cfdad45a3c2ee035588f88729868354e41b9fc5c38ab44')

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
  install -Dm755 packaging/bluegit-update.sh "$pkgdir/usr/lib/bluegit/update"
  install -Dm644 packaging/bluegit-update.service "$pkgdir/usr/lib/systemd/system/bluegit-update.service"
  install -Dm644 packaging/bluegit-update.rules "$pkgdir/usr/share/polkit-1/rules.d/49-bluegit-update.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
