# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ttchat
pkgver=0.1.11
pkgrel=1
pkgdesc="Twitch chats in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/atye/ttchat"
license=('MIT')
depends=()
makedepends=('go>=1.23.0')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40a2d32807ab7cbbca55f1d01428062f04bf498cf07817d7e9da3379e33b3f29')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "ttchat" .
}

check() {
	cd "$pkgname-$pkgver"
	export GOROOT=/usr/lib/go
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "ttchat" "$pkgdir/usr/bin/ttchat"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
