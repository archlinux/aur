# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker
pkgver=5.0.3
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums_x86_64=('3ee5da344f6ad871021b9748722850b7a281ae1d09b709581aeeb57ad0e1606d')

prepare () {
	cd "$pkgname-$pkgver"
	mkdir -p build/
	go mod download
}

build () {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build -ldflags "-linkmode=external -X '${url#https://}/cmd.Version=v$pkgver'"
}

check () {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go test ./...
}

package () {
	cd "$pkgname-$pkgver"
	install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
