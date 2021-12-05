# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=sniffer
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern alternative network traffic sniffer"
arch=('x86_64')
url="https://github.com/chenjiandongx/sniffer"
license=('MIT')
depends=('libpcap')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('137311a7f6967613698d357c66002cb64a0cb75a715ef65c1257c52a4b38acbb')

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
