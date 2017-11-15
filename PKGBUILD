# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=ltfs-quantum
pkgver=2.2.0
_pkgver2=5-00732-08
pkgrel=1
pkgdesc='Linear Tape File System'
arch=('x86_64' 'i686')
url='http://www.quantum.com/serviceandsupport/opensource/ltfs/index.aspx'
license=('custom:ltfs')
depends=('fuse' 'icu' 'libxml2')
makedepends=('patch' 'gcc' 'pkg-config' 'make' 'fakeroot')
backup=('etc/ltfs.conf.local')
source=("http://downloads.quantum.com/open_source/LTFS/${pkgver}/${_pkgver2}.zip"
        'LICENSE')
sha512sums=('bfbb5c47358563251c20c652834ba6c26ab24dd00ead3809d9c9d489cf7f5efef570bf470d481b18e327a3f7c1044de5814dfaad01a76da239ab6e237d0efa52'
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
