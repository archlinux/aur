# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=vulnx
pkgver=2.0.1
pkgrel=1
pkgdesc="Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities"
arch=('x86_64')
url="https://github.com/projectdiscovery/vulnx"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('101dcbc93c412b1acfb4b8149660488f42d5c5e4d1b3ff1fd8be3f41c787a4dc')

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
