# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.63.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('172fa91142e5c3eb0d8a87a95e99b8fc89be88ca9f0fe60a2bed89a2204079e3032fc4d6d744d3bab4897a0fe91228bc9d0585e6d8d61608e6a89dc2a869d8f2')

prepare() {
	cd "${_pkgname}-${pkgver}"
	mkdir --parents 'build'
}

build() {
	cd "${_pkgname}-${pkgver}"
	export \
		CGO_CPPFLAGS="${CPPFLAGS}" \
		CGO_CFLAGS="${CFLAGS}" \
		CGO_CXXFLAGS="${CXXFLAGS}" \
		CGO_LDFLAGS="${LDFLAGS}"
	go build \
		-buildmode=pie \
		-ldflags "
			-extldflags ${LDFLAGS}
			-linkmode=external
			-X main.version=$pkgver
		" \
		-mod=readonly \
		-o build \
		-trimpath \
			./cmd/...
}

check() {
	cd "${_pkgname}-${pkgver}"
	go test \
		-mod=readonly \
		-v \
			./cmd/...
}

package() {
	install -D --mode 755 "${_pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
