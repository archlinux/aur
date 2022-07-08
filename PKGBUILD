# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.44.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('13acbfa1783382c5cfe055f9236e13c3dc544a12e0d49eb120ad03c2d886eee2ed94249b0a6a1e5c46603fed0abb8cd9b63cdc30d77390a993907ac4c297b54e')

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
