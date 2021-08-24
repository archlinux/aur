# Maintainer: Recursive G <g.recursive at gmail dot com>
# Contributor: Jonathan Chasteen <jonathan.chasteen at live dot com>

pkgname=ltfs
pkgver=2.4.3.1
_pkgver2=10461
pkgrel=1
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='https://github.com/LinearTapeFileSystem/ltfs'
license=('BSD')
depends=('fuse' 'icu' 'libxml2')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot' 'net-snmp')
backup=('etc/ltfs.conf.local')
source=("https://github.com/LinearTapeFileSystem/ltfs/archive/refs/tags/v${pkgver}-${_pkgver2}.tar.gz")
sha256sums=('ae39778a47cb09c126fd394c269cbf464f7b43c876ea71a9c880e1159ce87066')

build() {
	cd "${srcdir}/ltfs-${pkgver}-${_pkgver2}"
	sed -i '/^AC_CONFIG_MACRO_DIR(\[m4\])$/d' configure.ac
	sed -i 's,sys/sysctl.h,linux/sysctl.h,' src/libltfs/arch/arch_info.c
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
