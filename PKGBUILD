# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tlsx
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast and configurable TLS grabber focused on TLS based data collection"
arch=('x86_64')
url="https://github.com/projectdiscovery/tlsx"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8f978b036b97b212ab4b954ba4a533adcb0425123d9dd8a4cde2d4948776628')

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
