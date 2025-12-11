# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>

pkgname=go-impl
pkgver=1.5.0
pkgrel=1
pkgdesc="Generate method stubs for implementing an interface."
arch=('x86_64')
url="https://github.com/josharian/impl"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6b508294e5245e1b31e4f081c9fd80867451d90f802cab70d64d44406a1efe02b000e167a22d5cfb91429b1a5b366f866505c3e4788223fb04031c9731223fe1')

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
