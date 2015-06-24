# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

_udev_ver=221
_src_uri='http://dev.gentoo.org/~blueness/eudev'

pkgname=eudev
pkgver=3.1.2
pkgrel=4
pkgdesc="The userspace dev tools (udev) forked by Gentoo"
arch=('i686' 'x86_64')
url="http://www.gentoo.org/proj/en/eudev/"
license=('GPL')
depends=('glib2' 'kbd' 'kmod' 'hwids' 'util-linux')
makedepends=('gobject-introspection' 'gperf' 'gtk-doc' 'intltool')
optdepends=('eudev-systemdcompat: makes packages compiled with systemd features run'
	    'upower-pm-utils: pm-utils support')
provides=("udev=${_udev_ver}"
	"libudev=${_udev_ver}"
	'libudev.so')
conflicts=('libudev.so')
backup=('etc/udev/udev.conf')
options=(!makeflags !libtool)
source=("https://github.com/gentoo/eudev/archive/v${pkgver}.tar.gz"
	'initcpio_hooks'
	'initcpio_install')
sha256sums=('f8b08fee36f7cf9389dd1dce67a863b717ea54437a96e0921f94e0497eb5dab6'
            '892ce43218e0a458981bbce451252c8987dc398e60b8de288e7542b8f2409c13'
            '77dd1fd318b4456409aceb077f060b87944defb07cf39d29ad1968dc6f361875')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-rootprefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--sbindir=/usr/bin \
		--with-html-dir=/usr/share/doc/${pkgname}-${pkgver}/html \
		--disable-gudev \
		--enable-introspection \
		--enable-kmod \
		--enable-manpages \
		--enable-split-usr

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	for i in "${pkgdir}/usr/lib/udev/rules.d/"*.rules; do
		sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
                            s#GROUP="tape"#GROUP="storage"#g;
                            s#GROUP="cdrom"#GROUP="optical"#g' "${i}"
	done

	install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
	install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"
}
