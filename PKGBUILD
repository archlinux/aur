# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=gotrust
pkgver=0.3.0
pkgrel=1
pkgdesc='Tray app for Sangfor aTrust gateways with local SOCKS5 and HTTP proxies'
arch=('x86_64' 'aarch64')
url='https://github.com/YangtseSu/goTrust'
license=('AGPL-3.0-or-later')
depends=('glibc' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
makedepends=('go' 'gcc')
conflicts=('gotrust-git')
options=('!debug')
_srcdir="goTrust-$pkgver"

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('519b6263b2522958a8c87433355d263b1f539fe3e4b730b2939339fef22e2607')

prepare() {
  cd "$_srcdir"
  # Fetch the modules here so build() needs no network.
  go mod download
}

build() {
  cd "$_srcdir"
  # cgo is only for the external linker, which applies FULL RELRO; GTK and the
  # tray are loaded through purego at runtime, so no cgo code runs.
  CGO_ENABLED=1 go build \
    -trimpath \
    -buildmode=pie \
    -ldflags "-s -w -linkmode=external -extldflags=-Wl,-z,relro,-z,now -X github.com/YangtseSu/goTrust/internal/version.Version=$pkgver" \
    -o gotrust ./cmd/gotrust
}

check() {
  cd "$_srcdir"
  go test ./...
}

package() {
  cd "$_srcdir"
  install -Dm755 gotrust "$pkgdir/usr/bin/gotrust"

  # The desktop entry and the icons ship with the source tree.
  install -Dm644 data/gotrust.desktop \
    "$pkgdir/usr/share/applications/gotrust.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/gotrust.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/gotrust.svg"
  install -Dm644 data/icons/hicolor/symbolic/apps/gotrust-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/gotrust-symbolic.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
