# Maintainer and contributor: Ethan Baker <mail@ethanbaker.dev>
pkgname='cpick'
pkgver=1.3.0
pkgrel=5
pkgdesc="Extensive color picker in the terminal!"
arch=('x86_64')
url="https://github.com/ethanbaker/cpick"
license=('Apache 2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ethanbaker/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5bceebb2b1ae98fad6d884a81d7ed2ab21c5c1714a9da1305fdfc6b230357c0')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/cpick "$pkgdir"/usr/bin/"$pkgname"
	install -Dm644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
