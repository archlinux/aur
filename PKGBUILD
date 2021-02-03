pkgname=ticker
pkgver=2.1.0
pkgrel=0
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64')
url="https://github.com/achannarasappa/ticker"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0edfc51c1cecd027975b6b88a44f148d0fb4ca1e2a1a9e9e22bef53260af1379')

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
