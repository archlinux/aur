# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=puredns
pkgver=2.1.1
pkgrel=1
pkgdesc="A fast domain resolver and subdomain bruteforcing tool that can accurately filter out wildcard subdomains and DNS poisoned entries"
arch=('x86_64')
url="https://github.com/d3mondev/puredns"
license=('GPL-3.0-or-later')
makedepends=('go')
depends=('massdns')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cff6466a422ab7db00a8277b32159cc6c416980f0921a5a7c72c43255d233c0f')

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
	go build -o build .
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
