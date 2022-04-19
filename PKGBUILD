# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
pkgver=2.4.0
pkgrel=1
pkgdesc="Extract urls from plain text"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/${pkgname}"
license=('BSD')
makedepends=('git' 'go')
source=("$pkgname-$pkgver::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c9850c80eff452eeca2fe0f945a33543302dc31df66c3393ed52f6d8e921702')

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
