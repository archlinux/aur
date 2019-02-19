# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=ltfs
pkgver=2.2.2
_pkgver2=5-00732-09
pkgrel=2
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='http://www.quantum.com/products/tapedrives/ltoultrium/lto-5/ltfs/index.aspx'
license=('custom:ltfs')
depends=('fuse' 'icu' 'libxml2')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot')
backup=('etc/ltfs.conf.local')
source=("http://downloads.quantum.com/open_source/LTFS/${pkgver}-${pkgrel}/${_pkgver2}.zip"
        'LICENSE')
sha512sums=('c7b430e8f4b05ea0d29fb344d1e8ebf0bb7d85511233e80d6f2d2a585579c05d632ada5edff23da3f6b451ad5a75f4ae49c81ecd78c0349832cdd49ba8943cf4'
            '865c4a581d32d94537ba8d19f2494ba9da54328cd94cf0cffac25b8f446cdeb062172d7598c45ac85477a239b5e5a9b7342a9a4711c54efa7f47b79d89c9d893')

prepare() {
	tar xf `find "${srcdir}" -name '*.tar.gz'`
}

build() {
	cd "${srcdir}/qtmltfs"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--localstatedir=/var

	make
}

package() {
	cd "${srcdir}/qtmltfs"

	# Not sure if using the makefile wrong
	sed -i 's:$(sysconfdir)/ltfs.conf.local:$(DESTDIR)$(sysconfdir)/ltfs.conf.local:g' "conf/Makefile"
	sed -i 's:${datarootdir}/ltfs:$(DESTDIR)${datarootdir}/ltfs:g' "init.d/Makefile"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ltfs"
	# This sysvinit service is not needed because systemd will umount everything on poweroff.
	rm -r "${pkgdir}/usr/share/ltfs"
}
