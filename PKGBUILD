# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dux-mail
pkgver=0.5.0
pkgrel=1
pkgdesc="Mail notifier, triage controller, and MCP server for Linux — Go daemon + Quickshell UI (Dux Shell aesthetic)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dux-mail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
provides=("dankmail=$pkgver")
conflicts=('dankmail')
replaces=('dankmail')
install=dux-mail.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee95f331c3119fbd56f9bf2673ee916e2b11942227552cb3da9b9fc5bc492077')

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
