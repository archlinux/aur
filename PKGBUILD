# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ícar N. S. <icar.nin@protonmail.com>

pkgname=crawley
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple web scraper"
arch=('x86_64' 'aarch64')
url="https://github.com/s0rg/crawley"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('61f98fb2a2ed11a17282793c66f569d423d33c84148fbd47fd1e5f17bd6781a8')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go vet ./...
	go build -o build ./cmd/crawley
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
