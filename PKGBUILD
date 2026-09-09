# Maintainer: Daniel Erat <dan-arch@erat.org>
pkgname=soundalike
pkgver=0.1.3
pkgrel=1
pkgdesc="Find duplicate audio files using acoustic fingerprints"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/derat/soundalike"
license=('BSD')
depends=('glibc' 'chromaprint')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c79b89e11189df4be7504bf482d13c79c7e24485bdeffb54f21eadb0b81b2d86')

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
