# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbish
pkgver=1.0.4
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('go')
install="$pkgname.install"
options=('!emptydirs')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e84db4b3ebd559c474240af01c9b02b7a1525f883f5e69984e8c6b9c4196d02')

prepare() {
	cd "Hilbish-$pkgver"
	sed -i '\|/etc/shells|d' Makefile
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "Hilbish-$pkgver"
	## `make build` does not build due to overriding our ldflags
	go build
}

check() {
	cd "Hilbish-$pkgver"
	go test ./...
}

package() {
	cd "Hilbish-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
