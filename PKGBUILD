# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=ltfs
pkgver=2.1.2
_pkgver2=5-00732-07
pkgrel=1
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='http://www.quantum.com/products/tapedrives/ltoultrium/lto-5/ltfs/index.aspx'
license=('custom:ltfs')
depends=('fuse' 'icu' 'libxml2')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot')
backup=('etc/ltfs.conf.local')
source=("http://downloads.quantum.com/open_source/LTFS/${pkgver}/${_pkgver2}.zip"
        'file_handle_redefinition.patch'
        'LICENSE')
sha512sums=('7cab930bbfd38fd2c608232be063aaa00570011cb8f5cbe62293336c175b7f0d4507135bd452917ac1fe3da0f7a138f44765e059a7cd5a37e90c29ecae8b308a'
            '81b2462a18c8a21faebc00411293a77958642cded8a29d4a531e2c7590ac3b4107915d6a480f064302b41e2cef819779395e3c357963b8c066c8700b7db3b816'
            '865c4a581d32d94537ba8d19f2494ba9da54328cd94cf0cffac25b8f446cdeb062172d7598c45ac85477a239b5e5a9b7342a9a4711c54efa7f47b79d89c9d893')

prepare() {
	tar xf `find "${srcdir}" -name '*.tar.gz'`
	patch -p0 -i "${srcdir}/file_handle_redefinition.patch"
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
