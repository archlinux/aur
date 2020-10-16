# Maintainer and Contributor: Ethan Baker <mail@ethanbaker.dev>
pkgname='cpick'
pkgver=v1.0.2
pkgrel=2
pkgdesc="Extensive color picker in the terminal."
arch=('x86_64')
url="https://gitlab.com/ethanbakerdev/cpick"
license=('Apache')
makedepends=('go')
source=("$url/-/archive/$pkgver/cpick-$pkgver.tar.gz")
sha256sums=('a35040101c802d932ebf60d3db7d0d3ef61c9898af06e98b027096bc0cd19036')

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
