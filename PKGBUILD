# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=fyora
pkgver=1.3.0
pkgrel=1
pkgdesc="Intuitive declarative dotfile management"
arch=('x86_64' 'aarch64')
url="https://github.com/wenbang24/fyora"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.23')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02ca9261bdb29fc91cc2cad9cb6ff984e5fee4a4fd4b335351c4cfe3ba59237a')

prepare() {
	cd "fyora-$pkgver"
	go mod download
}

build() {
	cd "fyora-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/$pkgname-build" .
}

package() {
	cd "fyora-$pkgver"
	install -Dm755 "$srcdir/$pkgname-build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
