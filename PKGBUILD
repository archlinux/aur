# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=sniffer
pkgver=0.5.1
pkgrel=1
pkgdesc="Modern alternative network traffic sniffer"
arch=('x86_64')
url="https://github.com/chenjiandongx/sniffer"
license=('MIT')
depends=('libpcap')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b9fbead3f72e31a6599e0dffa6e5f7e09b9a68baf6de69b7313f568988e93c6b')

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
	go build -o build
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/sniffer -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
