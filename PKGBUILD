# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=editorconfig-checker
pkgver=2.3.5
pkgrel=1
pkgdesc='A tool to verify that your files are in harmony with your .editorconfig'
arch=(any)
url="https://github.com/editorconfig-checker/$pkgname"
license=(MIT)
makedepends=(go)
provides=(ec)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('eefe32abf1220164ace859678300a52073d41dd229ba2eadc23de17315a248f6')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	ln -sf "$pkgname" "$pkgdir/usr/bin/ec"
	install -Dm644 -t  "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
