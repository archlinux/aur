# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tlsx
pkgver=1.1.8
pkgrel=1
pkgdesc=" Fast and configurable TLS grabber focused on TLS based data collection"
arch=('x86_64')
url="https://github.com/projectdiscovery/tlsx"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('272330eb814dc79d367b18c9aa5033a507f9214616d97ac4c1b2f75054767504')

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build/
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
