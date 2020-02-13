# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli
pkgver=0.8.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
depends=('docker')
makedepends=('go-pie')
source=(
	"pack-${pkgver}.tar.gz::https://github.com/buildpack/pack/archive/v${pkgver}.tar.gz"
	"Makefile.patch"
)
sha512sums=(
	"18b01a2e248970c4d761646319e17b5c246db944f231fdafc8f102195e0fa32b853e3c3fdf3eb23742cf531e766d4d4be2086479f0da266ee1806f062711615e"
	"f4e444e2a04c5f9bfbd112a8cd622c21f557d707f53508eede9f6cb7303b5e8537895b86ef1a6095e70b6060c1d64f8cf1e17d173d9b77e37e95193d76237d4b"
)
prepare() {
	cd "${srcdir}/pack-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/Makefile.patch"
}
build() {
	export GOPATH="${srcdir}/go"
	cd "${srcdir}/pack-${pkgver}"
	PACK_VERSION="v${pkgver}" make build
}
check() {
	export GOPATH="${srcdir}/go"
	export PATH="$PATH:${srcdir}/go/bin"
	cd "${srcdir}/pack-${pkgver}"
	# Tests require the Docker daemon.
	# make test
	make verify
}
package() {
	export GOPATH="${srcdir}/go"
	go clean -modcache
	install -D -m755 "${srcdir}/pack-${pkgver}/out/pack" "${pkgdir}/usr/bin/pack"
}
