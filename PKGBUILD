
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Yegorius <yegorius@domic.us>

pkgname=jetty
pkgver=9.3.2
_timestamp=v20150730
pkgrel=1
pkgdesc="Jetty is a pure Java-based HTTP server and Java Servlet container"
arch=('any')
url="http://www.eclipse.org/jetty/"
license=('Apache' 'EPL')
depends=('java-environment')
options=('!strip')
_distname=jetty-distribution-$pkgver.$_timestamp
_dluri="http://eclipse.org/downloads/download.php?file=/jetty/stable-9/dist/$_distname.tar.gz&r=1"
source=("$_distname.tar.gz::$_dluri"
	jetty.default
	jetty.logrotate
	jetty.service
	rundir.patch)
sha256sums=('c9d51e6e09c710cd084adb694149acfa93b90ba6a979cbaccc41e191bc4c14da'
            '51bc2d2931629eece6b70679d9e0a3d5695822c00dae02e67fd0216f482f040c'
            'da0402440e0a3b66e55387700b2c178c294dc65cc4a7bd079c622343845adecb'
            '36266b7f4daf20871f4bf5636686e37fa5ffd173fd51303f2569fc8d453fa17a'
            '8e12ab99278363d52bc083de886ccc5e2fe48e59dd8c419ce531503b94ad02ba')
install=$pkgname.install

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

	patch -Np1 -i "$srcdir/rundir.patch" "$pkgdir/usr/share/jetty/bin/jetty.sh"
	sed -i 's|su - |su -s /bin/sh - |' "$pkgdir/usr/share/jetty/bin/jetty.sh"

	rm "$pkgdir/usr/share/jetty/lib/setuid/libsetuid-osx.so"
}

