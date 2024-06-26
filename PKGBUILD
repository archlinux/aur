# Maintainer: Daniel Erat <dan-arch@erat.org>
pkgname=soundalike
pkgver=0.1.2
pkgrel=1
pkgdesc="Find duplicate audio files using acoustic fingerprints"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/derat/soundalike"
license=('BSD')
depends=('glibc' 'chromaprint')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8cea8bd736e20522cf90a9f886aacfd5b85e7d20930ededf3e3cff221552181a')

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod download
}

build() {
	cd "$pkgname"
	export CGO_LDFLAGS="$LDFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_ENABLED=1
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-X main.VERSION=v${pkgver}" -o build/ .
}

package() {
	cd "$pkgname"
	install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
