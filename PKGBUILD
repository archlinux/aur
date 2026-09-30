# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bafi
pkgver=1.3.0
pkgrel=1
pkgdesc="Universal JSON, BSON, YAML, CSV, XML translator to ANY format using templates"
arch=('x86_64' 'aarch64')
url="https://github.com/mmalcek/bafi"
license=('MIT')
depends=()
makedepends=('go>=1.23')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a708573c4709da81a18da4090abe40c9bd2939b1590ca7380c3dea0cc848abec')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "bafi" .
}

check() {
	cd "$pkgname-$pkgver"
	export TZ=UTC
	export GOROOT=/usr/lib/go
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "bafi" "$pkgdir/usr/bin/bafi"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
