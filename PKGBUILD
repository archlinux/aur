# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.45.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('f2eed3618d4e75c4a6609156d48760551e073feca43d0e93cad8946d94192770ee91de8535948326cc09c804a64fb6ec307f040e78806b572861a54012d18516')

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
