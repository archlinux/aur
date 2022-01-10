# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gtree
pkgver=1.3.0
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ddddddO/gtree"
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('50e218314c6bbcf84da57c5dbfac38c956f2fb2a2ce284c288f772811d4327e3')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build \
		-o build \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		. ./cmd/gtree
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/gtree -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
