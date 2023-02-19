# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>

pkgname=ticker
pkgver=4.5.6
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('59b15a98c1652a11878adf5b1c5318b0caa25a069e3fa90ce12adab1e9fafb2e')

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
}
