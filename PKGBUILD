# Maintainer: Sophie Tauchert <sophie at 999eagle dot moe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=4.4.4
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/quay/clair'
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=('postgresql: local database')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${pkgver}.tar.gz")
sha256sums=('7895442b6c5fb016513b859c4372826008d908ef85d2f506eaf1da301f9f13bc')
install='clair.install'

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build/
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} "
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build \
		-ldflags "-linkmode=external -X main.Version=${pkgver}" \
		-o build/ \
		./cmd/...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 build/clair "${pkgdir}/usr/bin/clair"
	install -Dm755 build/clairctl "${pkgdir}/usr/bin/clairctl"
	install -Dm755 config.yaml.sample "${pkgdir}/etc/clair/config.yaml"
	go clean -modcache # clean modcache
}
