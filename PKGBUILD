# Contributor: Brian F.G. <bidulock@openss7.org>
# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp
pkgver=1.10.1
pkgrel=2
pkgdesc="High performance PPTP/L2TP/PPPoE/IPoE server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('openssl>=1.0.0' 'pcre>=8.30' 'libnl')
makedepends=('cmake>=2.6' 'libnl1' 'net-snmp>=5.x' 'lua51')
optdepends=('accel-ppp-ipoe-dkms' 'logrotate')
conflicts=('accel-ppp-git')
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2
	accel-ppp.logrotate
	accel-ppp.lua
	accel-ppp.tmpfiles
	accel-pppd.service
	dictionary.accel_ipoe
	dictionary.ppp)
md5sums=('68a617acb228bf8e16a91196902e4307'
         '0536dd60960e76cf5a6cdbf0518782d8'
         '816dd5ea9534a077dfd63b6cd529738a'
         '5be7d42b434b74d7e692b19a9e3c4297'
         'e13fc55329910cd4dd0a9ee0b43bad97'
         '7e58716f1249f924ce218bd348d4c03a'
         '4e0d4fc5975ea8794ea286e8fbfa56cd')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|RUNTIME DESTINATION sbin|RUNTIME DESTINATION bin|' \
		"accel-pppd/CMakeLists.txt"
	if [ -d "build" ]; then
		rm -fr "build"
		mkdir "build"
	else
		mkdir "build"
	fi
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DLOG_FILE=TRUE \
		-DLOG_PGSQL=FALSE \
		-DSHAPER=TRUE \
		-DRADIUS=TRUE \
		-DNETSNMP=TRUE \
		-DLUA=TRUE \
		-DLUA_INCLUDE_DIR="/usr/include/lua5.1" \
		"$srcdir/$pkgname-$pkgver"
	make || return 1
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install || return 1

	[ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	install -dm0755 "$pkgdir/etc/logrotate.d/"
	install -dm0755 "$pkgdir/etc/snmp/"
	install -dm0755 "$pkgdir/var/lib/accel-ppp"
	touch "$pkgdir/etc/snmp/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm0644 "$srcdir/accel-pppd.service" "$pkgdir/usr/lib/systemd/system/accel-pppd.service"
	install -Dm0644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname.lua" "$pkgdir/etc/$pkgname.lua"
	install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm0644 "$srcdir/dictionary.accel_ipoe" "$pkgdir/usr/share/accel-ppp/radius/dictionary.accel_ipoe"
	install -Dm0644 "$srcdir/dictionary.ppp" "$pkgdir/usr/share/accel-ppp/radius/dictionary.ppp"
	install -Dm0644 "$pkgdir/etc/$pkgname.conf.dist" "$pkgdir/etc/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt" "$pkgdir/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

