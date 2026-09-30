# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rclone-tui
pkgver=0.0.3
pkgrel=1
pkgdesc="Cross-platform manager for rclone, aiming to be on-par with the web GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/darkhz/rclone-tui"
license=('MIT')
depends=('rclone')
makedepends=('go>=1.19')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('152f8671eeb4fc0fa6500b0b90aa12c42f117dcbfed1d36771514fef3a42a6c2')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "rclone-tui" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "rclone-tui" "$pkgdir/usr/bin/rclone-tui"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
