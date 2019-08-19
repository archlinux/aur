# Contributor: Brian F.G. <bidulock@openss7.org>
# Maintainer: Alexandr Boiko <4le34n at gmail dot com>
pkgname=accel-ppp
pkgver=1.12.0
pkgrel=1
pkgdesc="High performance PPTP/L2TP/PPPoE/IPoE server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('openssl>=1.0.0' 'pcre>=8.30' 'libnl' 'lua51')
makedepends=('cmake>=2.6' 'libnl1' 'net-snmp>=5.x')
optdepends=('accel-ppp-ipoe-dkms' 'accel-ppp-vlanmon-dkms' 'logrotate')
conflicts=('accel-ppp-git')
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf' 'usr/share/accel-ppp/radius/dictionary')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"
	'accel-ppp.logrotate'
	'accel-ppp.lua'
	'accel-ppp.tmpfiles'
	'accel-pppd.service'
	'dictionary.abills'
        'dictionary.accel_ipoe')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

        # Fix error build:
        #patch -p1 <../shaper.patch
        
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
		-DNETSNMP=FALSE \
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
	touch "$pkgdir/etc/snmp/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm0644 "$srcdir/accel-pppd.service" "$pkgdir/usr/lib/systemd/system/accel-pppd.service"
	install -Dm0644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname.lua" "$pkgdir/etc/$pkgname.lua"
	install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm0644 "$srcdir/dictionary.accel_ipoe" "$pkgdir/usr/share/accel-ppp/radius/dictionary.accel_ipoe"
	install -Dm0644 "$srcdir/dictionary.abills" "$pkgdir/usr/share/accel-ppp/radius/dictionary.abills"
	install -Dm0644 "$pkgdir/etc/$pkgname.conf.dist" "$pkgdir/etc/$pkgname.conf"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt" "$pkgdir/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
	install -Dm0644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('d0f2668e182ec99b64fcd6bc8fc2a19b'
         '0536dd60960e76cf5a6cdbf0518782d8'
         '1faebf39e7a665d756cae3e0e33831a9'
         '312fd63b9688a05b71a6b33ddd3a9f4b'
         '2cc98daa5fbd5b1163e5613e49fc9ef4'
         '4e0d4fc5975ea8794ea286e8fbfa56cd'
         '7e58716f1249f924ce218bd348d4c03a')
