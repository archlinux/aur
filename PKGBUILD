# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=gomoderate
pkgver=0.3.0
pkgrel=1
pkgdesc="Automated Bluesky moderation for a more pleasant experience"
arch=('x86_64')
url="https://github.com/thepudds/gomoderate"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8565c99c4d346e23f6354e3d81feb589554c1964895228bd9376ba2c101ad2d5')

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
	go mod download
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-X github.com/mrusme/neonmodem/config.VERSION=v${pkgver}" -o build/ .
}

check() {
	cd "${pkgname}-${pkgver}"
	# TODO: "This will currently fail when tested by people who are not @thepudds"
	# go test ./...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
