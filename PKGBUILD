# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nps
pkgver=0.26.6
pkgrel=1
pkgdesc="a lightweight, high-performance, powerful intranet penetration proxy server, with a powerful web management terminal. "
arch=('x86_64')
url="https://github.com/ehang-io/nps"
license=('GPL3')
makedepends=('go')
source=('nps.service' 'npc.service')
source_x86_64=(${pkgname}-${pkgver}.tar.gz::https://github.com/ehang-io/nps/archive/v${pkgver}.tar.gz)
sha256sums=('6baed4637ca0ba84f4f75f00d3d9340d8589bdf6472a9ad9177eee6ede149623'
            'f27851db99e564318d8473b2390ed278ec02f17cbebccc6d7d9fbf23179883cc')
sha256sums_x86_64=('e023419ec394fee46e4c0b81c1b673b24ef9701b88a79ee1ff2ae8a555401801')

prepare() {
	rm ${srcdir}/${pkgname}-${pkgver}/go.sum
}
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -extldflags -static -extldflags -static"  ./cmd/npc/npc.go
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -extldflags -static -extldflags -static"  ./cmd/nps/nps.go
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm 755 nps ${pkgdir}/usr/bin/nps
	install -Dm 755 npc ${pkgdir}/usr/bin/npc
	install -Dm 644 ${srcdir}/nps.service ${pkgdir}/usr/lib/systemd/system/nps.service
	install -Dm 644 ${srcdir}/npc.service ${pkgdir}/usr/lib/systemd/system/npc.service
	mkdir ${pkgdir}/etc/nps -p
	cp -r web conf ${pkgdir}/etc/nps	
	#nps install
}	
