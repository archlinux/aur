# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# IgH EtherCAT master does not release tarballs. Instead, it merges
# whatever stable into the `stable-1.5` branch.
# To get the `_count` number, I use `git describe | cut -f2 -d-` in a
# local clone.
_commit=f5d64bbab7548736de98b4865290c6f73b768527
_count=151
pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.5.r$_count
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org/en/ethercat/'
license=('GPL2')
makedepends=('linux-headers')
source=("https://gitlab.com/etherlab.org/ethercat/-/archive/$_commit/ethercat-$_commit.tar.bz2"
	"99-EtherCAT.rules")
md5sums=('956d015930aaeff87bcfe80e934ad455'
         'bd1c6d039d8fd947a727c8db0548cee9')

build() {
	cd "$srcdir/ethercat-$_commit"
	./bootstrap
	# Only build the generic driver
	./configure \
		--prefix=/usr --sysconfdir=/etc \
		--sbindir=/usr/bin --libdir=/usr/lib \
		--enable-kernel --enable-generic --disable-8139too \
		--enable-tool --enable-userlib
	make all modules
}

check() {
	cd "$srcdir/ethercat-$_commit"
	make check
}

package_etherlab-ethercat() {
	pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
	depends=('etherlab-ethercat-tools')
	install='etherlab-ethercat.install'

	cd "$srcdir/ethercat-$_commit"
	# By default kernel modules are installed in `/lib`
	# but archlinux expects them in `/usr/lib`
	make INSTALL_MOD_PATH="$pkgdir/usr" modules_install
	rm -f "$pkgdir"/usr/lib/modules/*/modules.*
	install -Dt "$pkgdir/etc/udev/rules.d/" -m0644 "$srcdir/99-EtherCAT.rules"
}

package_etherlab-ethercat-tools() {
	pkgdesc="Tools for IgH EtherCAT(R) Master component"

	cd "$srcdir/ethercat-$_commit"
	make DESTDIR="$pkgdir/" install
	install -Dt "$pkgdir/etc/systemd/system/" -m644 script/ethercat.service
}
