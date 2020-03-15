# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=2.1.2
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/coreos/clair'
license=('Apache')
depends=('rpm-tools' 'postgresql')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	export GOPATH="${srcdir}/go" PATH="${srcdir}/go/bin:${PATH}"
	go build \
		-ldflags "-s -w -X github.com/coreos/clair/pkg/version.Version=${pkgver}" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/clair -v ./cmd/clair
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "build/clair" "${pkgdir}/usr/bin/clair"
	install -Dm755 "config.example.yaml" "${pkgdir}/etc/clair/config.yaml"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}