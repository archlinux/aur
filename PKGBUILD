# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=neonmodem
pkgver=1.0.2
pkgrel=1
pkgdesc="Neon Modem Overdrive is a BBS-style, multi-backend discussion board TUI"
arch=('x86_64')
url="https://github.com/mrusme/neonmodem"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7eaadd055e2ce0af8c15503c58fd611997b0e40de2412bcb3c06c9f2a8b27bbc')

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
