# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli
pkgver=0.10.0
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
	"4b9ab63a7cf52a4272b5180e7fccece943341c7ab8237acb6e2e443cb8d61b50f0b8511f49cbd17354dd203b3a0bf1a0fbed7ff73010b03a24b56745c23aeb21"
	"b8e097648dd90c19ff2d76ce71ecc834979f797ca210079106c6e041c52ebb73b7171de03a167ca3a0d6e9c8be88d02dc18a4556c6423de41670f1bab5c7d25d"
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
