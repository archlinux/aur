# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=0.6.0
pkgrel=1
pkgdesc="Control your monitor by software using the DDC/CI protocol"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('pciutils' 'ddccontrol-db-git' 'perl-xml-parser' 'libxml2' 'icu' 'glib2')
makedepends=('gtk2' 'autoconf' 'automake' 'intltool' 'python')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ddccontrol/ddccontrol/archive/${pkgver}.tar.gz")
options=('!libtool')
sha512sums=('49e857e8ef8f2ba87dc51056b9511ce55f3e6471222cd9171a324e2ee179b8c96a8f4d90c63bb379260ccc8e1d9653964f90748d6589d298ff2bbe6982efd3e2')

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}

	test -f configure || ./autogen.sh
}

build() {
	cd "${srcdir}"/${pkgbase}-${pkgver}
	./configure \
		--prefix=/usr	\
		--disable-gnome-applet
	make
}

package_ddccontrol() {
	install=ddccontrol.install

	cd "${srcdir}"/${pkgbase}-${pkgver}

	for i in src/lib src/ddcpci src/daemon src/ddccontrol po man; do
		make DESTDIR="${pkgdir}" install -C $i
	done

	# fix bad path
	install -Dm644 \
		"$pkgdir/usr/etc/dbus-1/system.d/ddccontrol.DDCControl.conf" \
		"$pkgdir/usr/share/dbus-1/system.d/ddccontrol.DDCControl.conf"

	rm -rf "$pkgdir/usr/etc/"

	# cleanups
	rm "$pkgdir/usr/share/man/man1/gddccontrol.1"
}

package_gddccontrol() {
	depends=('gtk2' 'ddccontrol')
	pkgdesc="Control your monitor by software using the DDC/CI protocol (GUI)"
	conflicts=("ddccontrol-git")

	cd "${srcdir}"/${pkgbase}-${pkgver}

	for i in src/gddccontrol man; do
		make DESTDIR="${pkgdir}" install -C $i
	done

	# cleanups
	rm "$pkgdir/usr/share/man/man1/ddccontrol.1"
}
