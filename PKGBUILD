# Maintainer: Michael Corcoran <tracer@outlook.co.nz>
pkgname=libvirt-snmp-git
_pkgname=libvirt-snmp
pkgver=r28.5370943
pkgrel=2
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
        '001-u64-to-counter64.patch'
        "${_pkgname}.service"
        "${_pkgname}.install")
md5sums=('SKIP'
         '062bf2ba6682cc44e1483dddb64278c9'
         'f4b8b6345abe4fadab45e81290799029'
         'a101751363499dbb87492e040c6702ae')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	patch -p1 -i "${srcdir}/001-u64-to-counter64.patch"
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
