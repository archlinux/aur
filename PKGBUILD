# Maintainer: Michael Corcoran <tracer@outlook.co.nz>
pkgname=libvirt-snmp-git
_pkgname=libvirt-snmp
pkgver=r28.5370943
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
source=("$pkgname::git+https://github.com/libvirt/libvirt-snmp.git"
        '001-u64-to-counter64.patch')
md5sums=('SKIP'
         '062bf2ba6682cc44e1483dddb64278c9')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

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
}
