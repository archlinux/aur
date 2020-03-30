
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Yegorius <yegorius@domic.us>
# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=jetty
pkgver=9.4.27
_timestamp=v20200227
pkgrel=1
pkgdesc="Jetty is a pure Java-based HTTP server and Java Servlet container"
arch=('any')
url="http://www.eclipse.org/jetty/"
license=('Apache' 'EPL')
depends=('java-environment')
options=('!strip')
_distname=jetty-distribution-$pkgver.$_timestamp
source=(https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/$pkgver.$_timestamp/$_distname.tar.gz{,.asc}
        jetty.default
        jetty.logrotate
        jetty.service
        jetty.sysusers
        jetty.tmpfiles)
sha256sums=('b47b0990493196acdb82325e355019485f96ee12f9bf3d4f47a9ac748ab3d56a'
            'SKIP'
            'e5b425043a379bde57fd37c498ff8efb822325b7606b149cc09a53737ab4297d'
            'da0402440e0a3b66e55387700b2c178c294dc65cc4a7bd079c622343845adecb'
            'b27ef0342c3b22fbf1e3e7d104e23670b53eab9b648c1882cf295bd82ccadc66'
            '5664891275f3e489f85efd85b9740e36265f5ed3cf9512d245c500bdc31b568a'
            'b421e99f731635a68e59dabab803d1bbaecf11d338f17837cf0bb37c6bf32e6e')
validpgpkeys=('5989BAF76217B843D66BE55B2D0E1FB8FE4B68B4') # Joakim Erdfelt <joakim.erdfelt@gmail.com>


package() {
	cd "$srcdir/$_distname"

	install -dm755 "$pkgdir/etc/jetty"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/var/log/jetty"
	install -dm755 "$pkgdir/var/lib/jetty/webapps"

	install -Dm755 bin/jetty.sh "$pkgdir/usr/share/jetty/bin/jetty.sh"
	cp -r etc/* "$pkgdir/etc/jetty"
	cp -r {resources,start.ini} "$pkgdir/etc/jetty/"
	cp -r {lib,modules,start.jar,README.TXT} "$pkgdir/usr/share/jetty/"
	cp -r webapps/README.TXT "$pkgdir/var/lib/jetty/webapps"

	ln -s /etc/jetty "$pkgdir/usr/share/jetty/etc"
	ln -s etc/start.d "$pkgdir/usr/share/jetty/start.d"
	ln -s etc/start.ini "$pkgdir/usr/share/jetty/start.ini"
	ln -s etc/resources "$pkgdir/usr/share/jetty/resources"
	ln -s /usr/share/jetty/bin/jetty.sh "$pkgdir/usr/bin/jetty"
	ln -s /var/lib/jetty/webapps "$pkgdir/usr/share/jetty/webapps"

	install -Dm644 "$srcdir/jetty.default" "$pkgdir/etc/default/jetty"
	install -Dm644 "$srcdir/jetty.logrotate" "$pkgdir/etc/logrotate.d/jetty"
	install -Dm644 "$srcdir/jetty.service" "$pkgdir/usr/lib/systemd/system/jetty.service"
	install -Dm644 "$srcdir/jetty.sysusers" "$pkgdir/usr/lib/sysusers.d/jetty.conf"
	install -Dm644 "$srcdir/jetty.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/jetty.conf"

	sed -i 's|su - |su -s /bin/sh - |' "$pkgdir/usr/share/jetty/bin/jetty.sh"

	rm "$pkgdir/usr/share/jetty/lib/setuid/libsetuid-osx.so"
}

