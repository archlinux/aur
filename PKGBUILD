# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=wide-dhcpv6
pkgver=20080615
pkgrel=13
pkgdesc="An open source implementation of DHCPv6 developed by KAME project (with Debian patches)"
arch=('i686' 'x86_64')
url="http://wide-dhcpv6.sourceforge.net/"
license=('custom')
backup=('etc/wide-dhcpv6/dhcp6c.conf' 'etc/conf.d/startpd.conf')
options=('emptydirs')

source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/w/${pkgname}/${pkgname}_${pkgver}-11.1.debian.tar.gz"
	"0000-noyywrap-option.patch"
	"0001-renew.patch"
        "0002-Fix-makefile.patch"
        "dhcp6c.service"
	"dhcp6c@.service"
	"startpd.conf"
	"dhcp6c.conf")

install="dhcp6c.install"

md5sums=('1011e165850fe40d3e332dad2bfd30b3'
         'e6bb556a2791b8a825ea2209ce10f27e'
         '6bc5f3779f04cd1c74469b4942c1061d'
         '678789721081e90e9a0822de1bb1d347'
         'dfba035ab0fd99ae56ab2e37a000cba0'
         '7606280036a1a2c7c0a38af84803f41c'
         '897c6ccb3608e6ac33c3022631a49ee6'
         '8ec3740147eb2ff9ee7bec7070d2f008'
         '54866e3bdd4093efe89a2fc245e7f5ab')

prepare() {
	cd ${srcdir}
	cp debian/patches/*patch ${srcdir}
	# this is included in the new 0002 patch, so rm it
	rm "0002-Don-t-strip-binaries.patch"
	cd ${srcdir}/$pkgname-$pkgver
	for i in ../*patch ; do
		patch -p1 < ${i};
	done
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	pwd
	./configure --prefix=/usr \
	        --mandir=/usr/share/man \
		--with-localdbdir=/var/lib/dhcpv6 \
		--sysconfdir=/etc/wide-dhcpv6 \
		--sbindir=/usr/bin
	# -j > 1 breaks build dependencies
	make -j1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "${pkgdir}/var/lib/dhcpv6"
	mkdir -p "${pkgdir}/usr/share/man"
	mkdir -p "${pkgdir}/usr/share/man/man5"
	mkdir -p "${pkgdir}/usr/share/man/man8"
	#install -D -m644 ${srcdir}/${pkgname}-${pkgver}/dhcp6c.conf.sample \
	#        ${pkgdir}/etc/wide-dhcpv6/dhcp6c.conf
	install -D -m644 ${srcdir}/dhcp6c.conf \
		${pkgdir}/etc/wide-dhcpv6/dhcp6c.conf
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/dhcp6s.conf.sample \
		${pkgdir}/etc/wide-dhcpv6/dhcp6s.conf
	install -D -m644 ${srcdir}/dhcp6c.service \
		${pkgdir}/usr/lib/systemd/system/dhcp6c.service
	install -D -m644 ${srcdir}/dhcp6c@.service \
		${pkgdir}/usr/lib/systemd/system/dhcp6c@.service
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT \
		${pkgdir}/usr/share/licenses/wide-dhcpv6/LICENSE
	install -D -m644 ${srcdir}/startpd.conf \
		${pkgdir}/etc/conf.d/startpd.conf
	make DESTDIR="$pkgdir/" install
}

