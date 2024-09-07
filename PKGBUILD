# Maintainer: Recursive G <g.recursive at gmail dot com>
# Contributor: Jonathan Chasteen <jonathan.chasteen at live dot com>

pkgname=ltfs
pkgver=2.4.6.2
_pkgver2=10513
pkgrel=1
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='https://github.com/LinearTapeFileSystem/ltfs'
license=('BSD')
depends=('fuse' 'icu' 'libxml2' 'net-snmp')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot')
backup=('etc/ltfs.conf.local')
source=("https://github.com/LinearTapeFileSystem/ltfs/archive/refs/tags/v${pkgver}-${_pkgver2}.tar.gz")
sha256sums=('3ea9b210507f6bb2c9cd8f9d92f0c2ee321e24241dc5a402e557409a71531c91')

build() {
	cd "${srcdir}/ltfs-${pkgver}-${_pkgver2}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-fast

	make
}

package() {
	cd "${srcdir}/ltfs-${pkgver}-${_pkgver2}"

	# Not sure if using the makefile wrong
	# sed -i 's:$(sysconfdir)/ltfs.conf.local:$(DESTDIR)$(sysconfdir)/ltfs.conf.local:g' "conf/Makefile"
	# sed -i 's:${datarootdir}/ltfs:$(DESTDIR)${datarootdir}/ltfs:g' "init.d/Makefile"
	make DESTDIR="${pkgdir}" install

	#install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ltfs"
	# This sysvinit service is not needed because systemd will umount everything on poweroff.
	# rm -r "${pkgdir}/usr/share/ltfs"
}
