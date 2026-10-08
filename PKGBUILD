# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=smash
pkgver=1.0.0
pkgrel=1
pkgdesc="Find duplicate files super fast by slicing files intelligently"
arch=('x86_64' 'aarch64')
url="https://github.com/thushan/smash"
license=('Apache-2.0')
depends=()
makedepends=('go>=1.24')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eaf6457aafc1732033365e0eeba9d48042e7a387136c948eb03a17bfed33edd0')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X github.com/thushan/smash/internal/smash.Version=v$pkgver -X github.com/thushan/smash/internal/smash.Commit=v$pkgver" -o "smash" .
}

check() {
	cd "$pkgname-$pkgver"
	export GOROOT=/usr/lib/go
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "smash" "$pkgdir/usr/bin/smash"
	install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
