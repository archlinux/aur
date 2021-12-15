# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=editorconfig-checker
pkgver=2.4.0
pkgrel=1
pkgdesc='A tool to verify that your files are in harmony with your .editorconfig'
arch=(any)
url="https://github.com/editorconfig-checker/$pkgname"
license=(MIT)
makedepends=(go)
provides=(ec)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('11acac377a0e9916c062eeb4ddd1206fb6c35a0bd734108bd094a44c256767b5')

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
