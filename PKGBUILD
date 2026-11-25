# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dux-mail
pkgver=0.6.4
pkgrel=1
pkgdesc="Mail notifier, triage controller, and MCP server for Linux — Go daemon + Quickshell UI (Dux Shell aesthetic)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dux-mail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
provides=("dankmail=$pkgver")
conflicts=('dankmail<0.5.1')
replaces=('dankmail<0.5.1')
install=dux-mail.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed2787a41a62748f3fdd052510974e269bdc642f73d776f646e0824ff9ff773a')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  # Release archives have no Git metadata; version information is supplied below.
  export GOFLAGS="-trimpath -mod=readonly -modcacherw -buildvcs=false"
  make -C core build VERSION="v$pkgver" COMMIT="release"
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 assets/systemd/dmail.service "$pkgdir/usr/lib/systemd/user/dmail.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 quickshell/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
