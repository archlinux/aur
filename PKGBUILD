# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=go-impl
pkgver=1.4.0
pkgrel=1
pkgdesc="Generate method stubs for implementing an interface."
arch=('x86_64')
url="https://github.com/josharian/impl"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4ecd3cad79175341c0075acae06e8a4e203242e896c0bc3ac193c62dd371e97277794b0c0cf560671952bdf977c13cad1d2f7093b369ed16e56449757f681881')

prepare() {
	mkdir -p build
}

build() {
	cd "${pkgname##go-}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o ../build .
}

package() {
	install -Dm755 build/* -t "$pkgdir/usr/bin"
	cd "${pkgname##go-}-${pkgver}"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
