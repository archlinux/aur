# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli-git
pkgver=v0.10.0.r109.g0200ad7d
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
depends=('docker')
makedepends=(
	'git'
	'go-pie'
)
provides=('pack-cli')
conflicts=('pack-cli')
source=(
	"${pkgname}::git+https://github.com/buildpacks/pack"
	"Makefile.patch"
)
sha512sums=(
	"SKIP"
	"b8e097648dd90c19ff2d76ce71ecc834979f797ca210079106c6e041c52ebb73b7171de03a167ca3a0d6e9c8be88d02dc18a4556c6423de41670f1bab5c7d25d"
)

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd "${srcdir}/${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/Makefile.patch"
}
build() {
	export GOPATH="${srcdir}/go"
	cd "${srcdir}/${pkgname}"
	PACK_VERSION="$(git describe --abbrev=0 --tags)" make build
}
check() {
	export GOPATH="${srcdir}/go"
	export PATH="$PATH:${srcdir}/go/bin"
	cd "${srcdir}/${pkgname}"
	# Tests require the Docker daemon.
	# make test
	make verify
}
package() {
	export GOPATH="${srcdir}/go"
	go clean -modcache
	install -D -m755 "${srcdir}/${pkgname}/out/pack" "${pkgdir}/usr/bin/pack"
}
