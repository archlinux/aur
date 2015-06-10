# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-git
pkgver=r1179.b8b91d8
pkgrel=1
pkgdesc="High performance PPTP/L2TP/PPPoE/IPoE server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('openssl>=1.0.0' 'pcre>=8.30' 'libnl')
makedepends=('git' 'cmake>=2.6' 'libnl1' 'net-snmp>=5.x' 'lua51')
optdepends=('accel-ppp-ipoe-module-git' 'logrotate')
conflicts=('accel-ppp')
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf')
source=('accel-ppp::git+git://git.code.sf.net/p/accel-ppp/code'
    'accel-ppp-default'
	'accel-ppp.logrotate'
	'accel-ppp.lua'
	'accel-ppp.tmpfiles'
	'accel-pppd.service'
	'dictionary.accel_ipoe'
	'dictionary.ppp')

md5sums=('SKIP'
         'bb3e20c8808000f4efe52230c13a13f3'
         '0536dd60960e76cf5a6cdbf0518782d8'
         '816dd5ea9534a077dfd63b6cd529738a'
         '5be7d42b434b74d7e692b19a9e3c4297'
         'e5dec17bd405052fc647a805db5dd449'
         '7b94e1ab23db6c849dac3cb86246007d'
         '4e0d4fc5975ea8794ea286e8fbfa56cd')

_pkgname=accel-ppp

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
	
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
    cd "$srcdir/${pkgname%-git}/build/"
	cmake \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Debug \
		-DLOG_FILE=TRUE \
		-DLOG_PGSQL=FALSE \
		-DSHAPER=TRUE \
		-DRADIUS=TRUE \
		-DNETSNMP=TRUE \
		-DLUA=TRUE \
		-DLUA_INCLUDE_DIR="/usr/include/lua5.1" \
        "$srcdir/${pkgname%-git}"
	make || return 1
}
package() {
    cd "$srcdir/${pkgname%-git}/build/"
	make DESTDIR="$pkgdir/" install || return 1

	[ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	install -dm0755 "$pkgdir/etc/logrotate.d"
	install -dm0755 "$pkgdir/etc/snmp"
	install -dm0755 "$pkgdir/var/lib/accel-ppp"
	touch "$pkgdir/etc/snmp/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname-default" "$pkgdir/etc/conf.d/accel-pppd"
	install -Dm0644 "$srcdir/$_pkgname/README" "$pkgdir/usr/share/doc/$_pkgname/README"
	install -Dm0644 "$srcdir/accel-pppd.service" "$pkgdir/usr/lib/systemd/system/accel-pppd.service"
	install -Dm0644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname.lua" "$pkgdir/etc/$_pkgname.lua"
	install -Dm0644 "$srcdir/$_pkgname.logrotate" "$pkgdir/etc/logrotate.d/$_pkgname"
	install -Dm0644 "$srcdir/dictionary.accel_ipoe" "$pkgdir/usr/share/accel-ppp/radius/dictionary.accel_ipoe"
	install -Dm0644 "$srcdir/dictionary.ppp" "$pkgdir/usr/share/accel-ppp/radius/dictionary.ppp"
	install -Dm0644 "$pkgdir/etc/$_pkgname.conf.dist" "$pkgdir/etc/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt" "$pkgdir/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
	install -Dm0644 "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

