# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.53.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('309d96663b37fd7c2ed33e6b637b5892fda5b42d851735a8fcf857bb214b210481ef5e7e6e8637e6cfb88e8db8cdf95564de0a6070cd0154c8d98032d974ee5a')

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
