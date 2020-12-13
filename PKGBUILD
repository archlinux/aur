# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

_udev_ver=243git

pkgname=( 'eudev-git' 'libeudev-git')
pkgver=3.2.9
pkgrel=1
arch=('x86_64')
url="https://github.com/gentoo/eudev"
license=('GPL')
makedepends=('gobject-introspection' 'gperf' 'gtk-doc' 'intltool' 'kmod')
options=('!libtool' '!staticlibs')
source=("git+https://anongit.gentoo.org/git/proj/eudev.git"
	'initcpio_hooks'
	'initcpio_install'
	'udev-hwdb.hook')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd eudev
  git describe --tags | sed 's/-/+/g'
}

prepare(){
	cd eudev
	sed -e 's/GROUP="dialout"/GROUP="uucp"/' \
		-e 's/GROUP="tape"/GROUP="storage"/' \
		-e 's/GROUP="cdrom"/GROUP="optical"/' \
		-i rules/*.rules
}

groups=('base' 'base-openrc')

build() {
	cd eudev
	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-rootprefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--sbindir=/usr/bin \
		--enable-introspection \
		--enable-kmod \
		--disable-manpages \
		--enable-split-usr

	make
}

package_eudev-git() {
	pkgdesc="The userspace dev tools (udev) forked by Gentoo"
	provides=("udev=${_udev_ver}" "eudev")
	conflicts=(eudev)
	depends=("libeudev" 'kbd' 'kmod' 'hwids' 'util-linux')
	backup=('etc/udev/udev.conf')


	cd eudev

	make DESTDIR="${pkgdir}" install

	rm -rv "$pkgdir"/usr/lib/pkgconfig
	rm -v "$pkgdir"/usr/include/libudev.h
	rm -v "$pkgdir"/usr/lib/libudev*.{so*,a}

	install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
	install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"
	install -Dm644 "$srcdir/udev-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/udev-hwdb.hook"
}

package_libeudev-git() {
	pkgdesc="eudev client libraries"
	depends=('glib2' 'glibc')
	conflicts=('libudev.so' 'libeudev')
	provides=("libudev=${_udev_ver}" 'libudev.so' 'libeudev')

	cd eudev
	make -C src/libudev DESTDIR="$pkgdir" install
}
