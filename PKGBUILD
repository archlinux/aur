# Contributor: Holger Schramm <dev@strace.it>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Yegorius <yegorius@domic.us>
# Contributor: Sergey Shatunov <me@prok.pw>

pkgname=jetty11
pkgver=11.0.18
pkgrel=1
pkgdesc="Jetty is a pure Java-based HTTP server and Java Servlet container"
arch=('any')
url="http://www.eclipse.org/jetty/"
license=('Apache' 'EPL')
depends=('java-environment')
options=('!strip')
_distname=jetty-home-$pkgver
source=(https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/$pkgver/$_distname.tar.gz{,.asc}
        jetty.default
        jetty.logrotate
        jetty.service
        jetty.sysusers
        jetty.tmpfiles)

sha256sums=('1f1b4edabe985a8ebe300614824edd3523c3a90668c8ef6dffc35d239a4f90be'
            'SKIP'
            '4517310a4ed94248403e68b96b1e984d39e7073c6cd1dd9e312d00b9f4d2ca0f'
            'aef27b34d181f0f31a023e4b31c10347c711d0e45b89b9702e501709bd07689e'
            '56c318ce307726ffd667ec6024e1488266e70d0a1ed3802a2257e4edbbb0e61c'
            '425d9c157753129e7d003652ecbb746feb5591ba1a9abf0b4a8428c91b1511da'
            '66d8e095afc479484b9ee54d0cb48b1ad04236d487e59881622dbaf29f14f560')
validpgpkeys=('5989BAF76217B843D66BE55B2D0E1FB8FE4B68B4') # Joakim Erdfelt <joakim.erdfelt@gmail.com>


package() {
    cd "$srcdir/$_distname"

    install -dm755 "$pkgdir/etc/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/var/log/$pkgname"
    install -dm755 "$pkgdir/var/lib/$pkgname/webapps"

    install -Dm755 bin/jetty.sh "$pkgdir/usr/share/$pkgname/bin/jetty.sh"
    cp -r etc/* "$pkgdir/etc/$pkgname"
    cp -r {lib,modules,start.jar,README.adoc} "$pkgdir/usr/share/$pkgname/"
    install -dm755 "$pkgdir/etc/$pkgname/start.d"
    install -dm755 "$pkgdir/etc/$pkgname/resources"
    install -dm755 "$pkgdir/var/lib/$pkgname/webapps"

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

