# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: EnteEnteEnte <ducksource@duckpond.ch>

pkgname='teamspeak3-server'
pkgver='3.0.11.3'
pkgrel=2
pkgdesc='A proprietary VoIP conference software'
license=('custom')
arch=('i686' 'x86_64')
url="http://www.teamspeak.com"
depends=('')
makedepends=('curl')
backup=(etc/default/teamspeak3-server)
install='teamspeak3-server.install'
source=('teamspeak3-server.default'
        'teamspeak3-server.service')
source_i686=("http://teamspeak.gameserver.gamed.de/ts3/releases/$pkgver/teamspeak3-server_linux-x86-$pkgver.tar.gz")
source_x86_64=("http://teamspeak.gameserver.gamed.de/ts3/releases/$pkgver/teamspeak3-server_linux-amd64-$pkgver.tar.gz")
sha256sums=('ef0e074b8cb28ecb266d708c04e854664f31c3434023b7466fa8be24da719115'
            '0a86ec21f93cace2a663961f7d916fc1b17bae0291b418c821f2ad58dc052952')
sha256sums_i686=('adf1eaf74056b24ffee798a6668de6c001801546adea2423a626388215729fa6')
sha256sums_x86_64=('448d35de0de5c0c9b17feba0697fc232920fb68ac2880bbbf022e0386a17b63b')

if [ "$CARCH" == "x86_64" ]; then
  _TSARCH='amd64'
elif [ "$CARCH" == "i686" ]; then
  _TSARCH='x86'
fi

package() {
    cd "$srcdir"

    install -Dm 644 teamspeak3-server.default "$pkgdir/etc/default/teamspeak3-server"
    install -Dm 644 teamspeak3-server.service "$pkgdir/usr/lib/systemd/system/teamspeak3-server.service"

    install -Dm 755 "teamspeak3-server_linux-$_TSARCH/ts3server_linux_$_TSARCH" "$pkgdir/usr/bin/teamspeak3-server"
    install -Dm 644 "teamspeak3-server_linux-$_TSARCH/libts3db_mariadb.so" "$pkgdir/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "teamspeak3-server_linux-$_TSARCH/libts3db_sqlite3.so" "$pkgdir/usr/lib/libts3db_sqlite3.so"
    install -Dm 644 "teamspeak3-server_linux-$_TSARCH/LICENSE" "$pkgdir/usr/share/licenses/teamspeak3-server/LICENSE"

    mkdir -p "$pkgdir/usr/share/doc/teamspeak3-server" \
             "$pkgdir/usr/share/teamspeak3-server" \
             "$pkgdir/var/lib/teamspeak3-server" \
             "$pkgdir/var/log/teamspeak3-server"

    cp -a "teamspeak3-server_linux-$_TSARCH/doc/" "$pkgdir/usr/share/doc/teamspeak3-server/"
    cp -a "teamspeak3-server_linux-$_TSARCH/sql/" "$pkgdir/usr/share/teamspeak3-server/"

    find "$pkgdir/usr/share/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/teamspeak3-server" -type f -exec chmod 644 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type f -exec chmod 644 {} \;

    chmod 750 "$pkgdir/var/lib/teamspeak3-server" \
              "$pkgdir/var/log/teamspeak3-server"
}
