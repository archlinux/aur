# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.35.1
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('bac7cfc2c72ac9908badb142cad04354b765d5a0f61500cc7f8b258600727f86f6a659b4d3fee09a592a521b8b6fb5dd1c9485a3b6c7ca0a4731ad6028f51362')

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
		CGO_LDFLAGS="${LDFLAGS}" \
		GOPROXY=off
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
