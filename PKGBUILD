# Maintainer: Michael Corcoran <tracer@outlook.co.nz>
pkgname=libvirt-snmp-git
_pkgname=libvirt-snmp
pkgver=r30.1ad3cf3
pkgrel=1
pkgdesc="net-snmp agent for libvirt virtualization management"
arch=('x86_64')
url="http://libvirt.org/"
license=('GPL')
depends=('libvirt'
         'net-snmp')
makedepends=('git'
             'perl')
provides=($_pkgname)
conflicts=($_pkgname)
install=${_pkgname}.install
source=("$pkgname::git+https://github.com/libvirt/libvirt-snmp.git"
        "${_pkgname}.service"
        "${_pkgname}.install")
md5sums=('SKIP'
         'f4b8b6345abe4fadab45e81290799029'
         'a101751363499dbb87492e040c6702ae')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 "${srcdir}/libvirt-snmp.service" "${pkgdir}/usr/lib/systemd/system/libvirt-snmp.service"
}
