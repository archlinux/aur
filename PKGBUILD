# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## We are targeting a specific commit for this release because upstream
## switched to Go modules, making packaging SO much easier

pkgname=yeetgif
pkgver=1.23.6
pkgrel=1
pkgdesc="GIF effects tool for creating emotes"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sgreben/yeetgif"
license=('MIT')
depends=('glibc')
optdepends=("gifsicle: 'optimize' command support")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/5d2067b.tar.gz")
sha256sums=('7e661cdf7398f8b0017c8cc8758e65a378edb7502bef081d45055fd7510f0017')

prepare() {
	mv "$pkgname-5d2067b9832898c2b1ac51bf6a5f107619038270" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build ./cmd/gif
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/gif -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
