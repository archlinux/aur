# Maintainer and contributor: Ethan Baker <mail@ethanbaker.dev>
pkgname='cpick'
pkgver=v1.2.0
pkgrel=3
pkgdesc="Extensive color picker in the terminal."
arch=('x86_64')
url="https://github.com/ethanbaker/cpick"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ethanbaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ce0afc7e1382b8d298f0b6bc1dc9cbf094984d50407b0c5a85708c79f55cc38')

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
