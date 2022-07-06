# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=oauth2l
pkgver=1.2.2
pkgrel=1
pkgdesc='Simple CLI for interacting with Google API authentication'
arch=('x86_64')
url="https://github.com/google/${pkgname}"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bb4998b52413920d26b893113ce6c915677c2bcccb2a34e280e23cf4205e45e2eb5bdc38d539d97d26f801914e9a0ca73a393f6480fe46c5df345f94f0e65b0f')

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
