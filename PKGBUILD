# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
pkgver=2.3.0
pkgrel=1
pkgdesc="Extract urls from plain text"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/${pkgname}"
license=('BSD')
makedepends=('git' 'go')
source=("$pkgname-$pkgver::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4a5451eab432f6ac4c033fc197b7ceb947910bc1eae0db750b7c5c5ad703c46')

prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
