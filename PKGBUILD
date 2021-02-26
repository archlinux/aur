# Maintainer: bin <bin at datacowboy dot cf>
pkgname=ticker
pkgver=3.1.9
pkgrel=0
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64')
url="https://github.com/achannarasappa/ticker"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f70f836d96d77ffd31b9a5e1be7a812e02ccad1e3f61c1ec967e64243e33179d')

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
