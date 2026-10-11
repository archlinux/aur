# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyntfy
pkgver=0.1.0
pkgrel=1
pkgdesc="A lazygit-style terminal client for ntfy"
arch=('x86_64' 'aarch64')
url="https://src.panahifar.ir/ahp/lazyntfy"
license=('GPL-3.0-or-later')
depends=('ca-certificates')
makedepends=('go')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72c8d2675b4b3241197748793b2e16afd7e1c61102433efbaf0bf93dd59c9141')

prepare() {
	cd "$pkgname"
	go mod download
}

build() {
	cd "$pkgname"
	export CGO_ENABLED=0
	go build -trimpath -ldflags "-s -w -X main.version=$pkgver" -o lazyntfy ./cmd/lazyntfy
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -Dm755 lazyntfy "$pkgdir/usr/bin/lazyntfy"
	install -Dm644 man/lazyntfy.1 "$pkgdir/usr/share/man/man1/lazyntfy.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
