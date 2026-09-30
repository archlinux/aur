# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=backhub
pkgver=0.7.0
pkgrel=1
pkgdesc="Maintain backups of multiple GitHub repos as full local mirrors"
arch=('x86_64' 'aarch64')
url="https://github.com/Tanq16/backhub"
license=('MIT')
depends=('git')
makedepends=('go>=1.23.4')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d407532352af335cab722af81d03868c380ae6f75bae5130ebe0222944576f5f')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "backhub" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "backhub" "$pkgdir/usr/bin/backhub"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
