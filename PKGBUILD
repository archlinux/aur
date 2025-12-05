# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Holger Schramm <dev@strace.it>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Yegorius <yegorius@domic.us>
# Contributor: Sergey Shatunov <me@prok.pw>

pkgname=jetty
pkgver=12.1.5
pkgrel=1
pkgdesc="A pure Java-based HTTP server and Java Servlet container"
arch=('any')
url="http://www.eclipse.org/jetty/"
license=('Apache-2.0' 'EPL-2.0')
depends=('java-environment')
options=('!strip')
_distname="$pkgname-home-$pkgver"

source=(https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/$pkgver/$_distname.tar.gz
        jetty.default
        jetty.logrotate
        jetty.service
        jetty.sysusers
        jetty.tmpfiles)

sha256sums=('b6364eeceb50ec565000603d948e1820ac26f995b47898064da35df996ac0d8e'
            'd3190c73096fdb9f3c2aeef00b568c75431b0fbc0c322a2b21b06e829ce1852f'
            'da0402440e0a3b66e55387700b2c178c294dc65cc4a7bd079c622343845adecb'
            'b27ef0342c3b22fbf1e3e7d104e23670b53eab9b648c1882cf295bd82ccadc66'
            '5664891275f3e489f85efd85b9740e36265f5ed3cf9512d245c500bdc31b568a'
            'a69fa966c33343cb42394d80796ebfb29f5325c7610d8214657cdd17c58cc8d3')


package() {
    cd "$srcdir/$_distname"

    install -dm2755 "$pkgdir/etc/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm2755 "$pkgdir/var/log/$pkgname"
    install -dm2755 "$pkgdir/var/lib/$pkgname/webapps"

    install -Dm755 bin/jetty.sh "$pkgdir/usr/share/$pkgname/bin/jetty.sh"
    cp -r etc/* "$pkgdir/etc/$pkgname"
    find "$pkgdir/etc/$pkgname" -type f -exec chmod 640 {} + -o -type d -exec chmod 2755 {} +

    cp -r {lib,modules,start.jar,README.adoc} "$pkgdir/usr/share/$pkgname/"
    install -dm2755 "$pkgdir/etc/$pkgname/start.d"
    install -dm2755 "$pkgdir/etc/$pkgname/resources"
    install -dm2755 "$pkgdir/var/lib/$pkgname/webapps"

    ln -s /etc/$pkgname "$pkgdir/usr/share/$pkgname/etc"
    ln -s etc/start.d "$pkgdir/usr/share/$pkgname/start.d"
    ln -s etc/resources "$pkgdir/usr/share/$pkgname/resources"
    ln -s /usr/share/$pkgname/bin/jetty.sh "$pkgdir/usr/bin/$pkgname"
    ln -s /var/lib/$pkgname/webapps "$pkgdir/usr/share/$pkgname/webapps"
    ln -s /var/log/$pkgname "$pkgdir/usr/share/$pkgname/logs"

    install -Dm644 "$srcdir/jetty.default" "$pkgdir/etc/default/$pkgname"
    install -Dm644 "$srcdir/jetty.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
    install -Dm644 "$srcdir/jetty.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/jetty.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/jetty.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

    sed -i 's|su - |su -s /bin/sh - |' "$pkgdir/usr/share/$pkgname/bin/jetty.sh"
}

