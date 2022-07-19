# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=oauth2l
pkgver=1.3.0
pkgrel=1
pkgdesc='Simple CLI for interacting with Google API authentication'
arch=('x86_64')
url="https://github.com/google/${pkgname}"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('83044b616e65881d54b78bd8e6d9ec6890cd3087a91c8574a976aa2f5f1ed1ac4fa2d50fd9d438a8b608d53af2a56e232c304cc2c984ac3b582fffdfe2ca01df')

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir --parents 'build'
}

build() {
	cd "${pkgname}-${pkgver}"
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
		-modcacherw \
		-o build \
		-trimpath \
			./...
}

#check() {
#	cd "${pkgname}-${pkgver}"
#	go test \
#		-mod=readonly \
#		-v \
#			./...
#}

package() {
	install -D --mode 755 "${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
