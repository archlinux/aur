# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Bobby Burden III <bobby@brb3.org>

pkgname=torsniff
pkgver=0.1.0
pkgrel=1
pkgdesc='Fetches torrents from BitTorrent network'
arch=('x86_64' 'i686')
url='https://github.com/fanpei91/torsniff'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b17668c9d6a41b566bf1630a2163e007fc2277c7db52b6dc5be69c873bbe12e7')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod init "${url#https://}"
	go mod tidy
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
	install -D build/torsniff -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
