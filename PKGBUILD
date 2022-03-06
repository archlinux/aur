# Maintainer: bin <bin at datacowboy dot cf>
pkgname=ticker
pkgver=4.5.1
pkgrel=0
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64')
url="https://github.com/achannarasappa/ticker"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('16f2cbacbf2d2540623bb5b26c445739c7a1adc27e7ef6038828149a43708a4557dc7bc4bfc48fb95441116187275bb6b25b77f804e757f3cbffeecde0c39572')

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
