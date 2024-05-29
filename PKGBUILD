# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=neonmodem
pkgver=1.0.5
pkgrel=1
pkgdesc="Neon Modem Overdrive is a BBS-style, multi-backend discussion board TUI"
arch=('x86_64')
url="https://github.com/mrusme/neonmodem"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0c998e5d3ccaaecdc2c5826a280aecffe5b791bf0535a3377fb133db636d6cf')

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
	go test ./...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
