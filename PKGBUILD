# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: darkhz <kmachanwenw at gmail dot com>

pkgname=bluetuith
pkgver=0.1.9
pkgrel=1
pkgdesc="TUI-based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3047c64b2240888b75a1d50243042bc7dd01bbeaac29f63d28ddb5cab76cd8ee')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
