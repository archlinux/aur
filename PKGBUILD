# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=vulnx
_pkgname=cvemap
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities"
arch=('x86_64')
url="https://github.com/projectdiscovery/cvemap"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76146c23e94493106c9d9bc6f039b33e182415d0a35e5adf43b83f1712cf8d35')

prepare() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p build/
}

build() {
	cd "${_pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
