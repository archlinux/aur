# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=humblebee
pkgver=0.7.0
pkgrel=1
pkgdesc="Local-first command-line time tracking that stays out of your way"
arch=('x86_64' 'aarch64')
url="https://github.com/grobmeier/humblebee"
license=('Apache-2.0')
depends=()
makedepends=('go>=1.25')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3e3baea2f3df49aa73190a2aea1cdd230efa00932d491813e263d79fd2c65fc')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=$pkgver -X main.commit=v$pkgver" -o "$pkgname" ./cmd/humblebee
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
