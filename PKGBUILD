# Maintainer: Alexandr Boiko <4le34n at gmail dot com>
pkgname=accel-ppp-git
pkgver=1.12.0_57_gc983d6f
pkgrel=1
pkgdesc="High performance PPTP/L2TP/PPPoE/IPoE server"
arch=('i686' 'x86_64')
url="https://github.com/accel-ppp/accel-ppp"
license=('GPL')
depends=('openssl>=1.0.0' 'pcre>=8.30' 'libnl>=2.0' 'lua')
makedepends=('git' 'cmake>=2.6' 'libnl1' 'net-snmp>=5.x')
optdepends=('accel-ppp-ipoe-dkms-git' 'accel-ppp-vlanmon-dkms-git' 'logrotate')
conflicts=('accel-ppp')
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf' 'usr/share/accel-ppp/radius/dictionary')
source=("accel-ppp::git+$url"
	'accel-ppp.logrotate'
	'accel-ppp.lua'
	'accel-ppp.tmpfiles'
	'accel-pppd.service'
	'dictionary.abills'
	'dictionary.accel_ipoe'
        'shaper.patch')

_pkgname=accel-ppp

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 'y/-/_/')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

        # Fix error build tc shaper:
        patch -p1 <../shaper.patch
	
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
                -DMEMDEBUG=TRUE \
		-DLOG_FILE=TRUE \
		-DLOG_PGSQL=FALSE \
		-DSHAPER=TRUE \
		-DRADIUS=TRUE \
		-DNETSNMP=FALSE \
		-DLUA=5.3 \
		-DLUA_INCLUDE_DIR="/usr/include" \
        "$srcdir/${pkgname%-git}"
	make || return 1
}
package() {
    cd "$srcdir/${pkgname%-git}/build/"
	make DESTDIR="$pkgdir/" install || return 1

	[ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	install -dm0755 "$pkgdir/etc/logrotate.d"
	install -dm0755 "$pkgdir/etc/snmp"
	touch "$pkgdir/etc/snmp/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname/README" "$pkgdir/usr/share/doc/$_pkgname/README"
	install -Dm0644 "$srcdir/accel-pppd.service" "$pkgdir/usr/lib/systemd/system/accel-pppd.service"
	install -Dm0644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname.lua" "$pkgdir/etc/$_pkgname.lua"
	install -Dm0644 "$srcdir/$_pkgname.logrotate" "$pkgdir/etc/logrotate.d/$_pkgname"
	install -Dm0644 "$srcdir/dictionary.accel_ipoe" "$pkgdir/usr/share/accel-ppp/radius/dictionary.accel_ipoe"
	install -Dm0644 "$srcdir/dictionary.abills" "$pkgdir/usr/share/accel-ppp/radius/dictionary.abills"
	install -Dm0644 "$pkgdir/etc/$_pkgname.conf.dist" "$pkgdir/etc/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt" "$pkgdir/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
	install -Dm0644 "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

md5sums=('SKIP'
         '0536dd60960e76cf5a6cdbf0518782d8'
         '1faebf39e7a665d756cae3e0e33831a9'
         '312fd63b9688a05b71a6b33ddd3a9f4b'
         '2cc98daa5fbd5b1163e5613e49fc9ef4'
         '4e0d4fc5975ea8794ea286e8fbfa56cd'
         '7caeb22558376885258f649ff8b07b18'
         'c203b966d62f3b04bf413f7b46af4212')
