# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=getghrel
pkgver=0.1.3
pkgrel=1
pkgdesc="User-friendly CLI that fetches and installs the latest release assets from GitHub for macOS and Linux, auto-detecting OS and architecture"
arch=('x86_64' 'aarch64')
url="https://github.com/kavishgr/ghrelease"
license=('MIT')
depends=()
makedepends=('go>=1.25.5')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('284eeeee532729965c8650a7d1b3c76eaef1b2306431df9bf684563f78411709')

prepare() {
	cd "ghrelease-$pkgver"
	go mod download
}

build() {
	cd "ghrelease-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=$pkgver -X main.commit=v$pkgver" -o "getghrel" .
}

package() {
	cd "ghrelease-$pkgver"
	install -Dm755 "getghrel" "$pkgdir/usr/bin/getghrel"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
