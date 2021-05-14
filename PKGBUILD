# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=0.5.2
pkgrel=1
pkgdesc="Control your monitor by software using the DDC/CI protocol"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('pciutils' 'ddccontrol-db-git' 'perl-xml-parser' 'libxml2' 'icu' 'glib2')
makedepends=('gtk2' 'autoconf' 'intltool' 'python')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ddccontrol/ddccontrol/archive/${pkgver}.tar.gz")
options=('!libtool')
sha512sums=('909284f4c52d378f248d11fa949c1db01d60f2cf7bd8bec9faac8bd9844650760f728f7559fe5aef10487569f88ef9af29070a394ee7ee026c6d7d4989f6c0b0')

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}

	# fix for autoconf older than 2.70 (suggested by jbbr)
	local _version_required="2.70-1"
	local _version_installed="$(pacman -Q autoconf|cut -d\  -f2)"
	local _is_older="$(vercmp $_version_required $_version_installed)"

	if [ "$_is_older" = "1" ]; then
		msg2 "Running autogen (for autoconf<$_version_required)"
		test -f configure || ./autogen.sh
	else
		msg2 "Running autogen (for autoconf>=$_version_required)"
		test -f configure || INTLTOOLIZE='intltoolize --force' autoreconf --install
	fi
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
