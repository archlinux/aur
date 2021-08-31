# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=shox
pkgver=0.0.19
pkgrel=1
pkgdesc="A customisable, universally compatible terminal status bar"
arch=('x86_64')
url="https://github.com/liamg/shox"
license=('MIT')
depends=('libx11' 'libxcursor' 'libxinerama' 'xorg-xinput')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
	go build -o build -ldflags="-linkmode=external" ./cmd/shox
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 build/shox -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
