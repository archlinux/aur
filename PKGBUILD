# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Command line tool for processing HTML'
pkgname=pup
pkgver=0.4.0
pkgrel=3
url=https://github.com/ericchiang/pup
makedepends=(go-pie git)
license=(custom:MIT)
depends=(glibc)
arch=(x86_64)
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=(SKIP)

prepare () {
	cd "${pkgname}-${pkgver}"
	git show 681d7bb639334bf485476f5872c5bdab10931f9a | patch -p1
}

build () {
	cd "${pkgname}-${pkgver}"
	CGO_ENABLED=0 go build -mod=vendor -trimpath \
		-ldflags "-extldflags '${LDFLAGS}'" \
		-o pup .
}

check () {
	cd "${pkgname}-${pkgver}"
	CGO_ENABLED=0 go test -mod=vendor .
}

package () {
	cd "${pkgname}-${pkgver}"
	install -m755 -Dt "${pkgdir}/usr/bin" pup
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
