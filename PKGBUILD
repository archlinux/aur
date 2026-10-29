# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=gotrust-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='Headless front-end for Sangfor aTrust gateways with local SOCKS5 and HTTP proxies'
arch=('x86_64' 'aarch64')
url='https://github.com/YangtseSu/goTrust'
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'gcc')
conflicts=('gotrust-cli-git')
options=('!debug')
_srcdir="goTrust-$pkgver"

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('519b6263b2522958a8c87433355d263b1f539fe3e4b730b2939339fef22e2607')

prepare() {
  cd "$_srcdir"
  go mod download
}

build() {
  cd "$_srcdir"
  CGO_ENABLED=1 go build \
    -trimpath \
    -buildmode=pie \
    -ldflags "-s -w -linkmode=external -extldflags=-Wl,-z,relro,-z,now -X github.com/YangtseSu/goTrust/internal/version.Version=$pkgver" \
    -o gotrust-cli ./cmd/gotrust-cli
}

check() {
  cd "$_srcdir"
  go test ./...
}

package() {
  cd "$_srcdir"
  install -Dm755 gotrust-cli "$pkgdir/usr/bin/gotrust-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
