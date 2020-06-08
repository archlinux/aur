# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgbase='nps'
pkgname=('nps' 'npc')
pkgver=0.26.7
pkgrel=2	
pkgdesc="a lightweight, high-performance, powerful intranet penetration proxy server, with a powerful web management terminal. "
arch=('x86_64')
url="https://github.com/ehang-io/nps"
license=('GPL3')
makedepends=('go')
source=('nps.service' 
		'npc.service' 
		"${pkgname}-${pkgver}.tar.gz::https://github.com/ehang-io/nps/archive/v${pkgver}.tar.gz")

md5sums=('a31b25cbee5112bb6518eb30ed99c9c8'
         '19604ddc44a9be0b5ffe4e42d8b91ed0'
         'b53cd2a24d017a9fc5e6a7b8e101a456')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}
	rm -f go.sum
}
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build ./cmd/npc/npc.go
	go build ./cmd/nps/nps.go
}
packaging() {
	install -Dm 755 ${1} ${pkgdir}/usr/bin/${1}
	install -Dm 644 ${srcdir}/${1}.service ${pkgdir}/usr/lib/systemd/system/${1}.service
}
package_npc() {
	cd ${srcdir}/${pkgbase}-${pkgver}
	_name=`echo ${FUNCNAME} | cut -d _ -f 2`
	packaging ${_name}
	backup=("etc/nps/conf/${_name}.conf")

	install -Dm 644 conf/${_name}.conf ${pkgdir}/etc/nps/conf/${_name}.conf
}	
package_nps() {
	cd ${srcdir}/${pkgbase}-${pkgver}
	_name=`echo ${FUNCNAME} | cut -d _ -f 2`
	packaging ${_name}
	backup=("etc/nps/conf/${_name}.conf")

	mkdir -p ${pkgdir}/etc/nps
	cp -r conf web ${pkgdir}/etc/nps	
	rm ${pkgdir}/etc/nps/conf/npc.conf
}	
