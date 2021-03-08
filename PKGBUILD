# Maintainer: bin <bin at datacowboy dot cf>
pkgname=ticker
pkgver=4.0.1
pkgrel=0
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64')
url="https://github.com/achannarasappa/ticker"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3f8445ce1c51a2ddea7249198c9d38ba467118f19741e9ff2093c0ee11b40f3c')

prepare () {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build () {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build/$pkgname main.go
}

check () {
	cd "$pkgname-$pkgver"
	go test ./...
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
