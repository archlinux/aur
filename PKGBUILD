# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: EnteEnteEnte <ducksource@duckpond.ch>

pkgname='teamspeak3-server'
pkgver='3.0.13.2'
pkgrel=1
pkgdesc='A proprietary VoIP conference software'
license=('custom')
arch=('i686' 'x86_64')
url="http://www.teamspeak.com"
depends=('glibc')
optdepends=('mariadb-connector-c: for MariaDB backend')
backup=(etc/teamspeak3-server.ini)
install='teamspeak3-server.install'
source=('teamspeak3-server.ini'
        'teamspeak3-server.service')
source_i686=("http://teamspeak.gameserver.gamed.de/ts3/releases/$pkgver/teamspeak3-server_linux_x86-$pkgver.tar.bz2")
source_x86_64=("http://teamspeak.gameserver.gamed.de/ts3/releases/$pkgver/teamspeak3-server_linux_amd64-$pkgver.tar.bz2")
sha256sums=('c678f5d657772920260c4ea4718677e6b00ef28ad74c317e05632a01d33b3ca5'
            'e278e962cb0068059d5a0b981110dce1a708de59bb8355cdfc6b519dc14b21fa')
sha256sums_i686=('02f18b2f2db42ef4e78dd936ca61ac1f10db5fc959d7888ba8c6401d9c8c63be')
sha256sums_x86_64=('f7dd49a38126fb6a4c0e7818575c7d898556330cafe5fc59b20d9f10744f6799')

if [ "$CARCH" == "x86_64" ]; then
  _TSARCH='amd64'
elif [ "$CARCH" == "i686" ]; then
  _TSARCH='x86'
fi

package() {
    cd "$srcdir"

    install -Dm 644 teamspeak3-server.ini "$pkgdir/etc/teamspeak3-server.ini"
    install -Dm 644 teamspeak3-server.service "$pkgdir/usr/lib/systemd/system/teamspeak3-server.service"

    install -Dm 755 "teamspeak3-server_linux_$_TSARCH/ts3server" "$pkgdir/usr/bin/ts3server"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_mariadb.so" "$pkgdir/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_sqlite3.so" "$pkgdir/usr/lib/libts3db_sqlite3.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/LICENSE" "$pkgdir/usr/share/licenses/teamspeak3-server/LICENSE"

    mkdir -p "$pkgdir/usr/share/doc/teamspeak3-server" \
             "$pkgdir/usr/share/teamspeak3-server" \
             "$pkgdir/var/lib/teamspeak3-server" \
             "$pkgdir/var/log/teamspeak3-server"

    cp -a "teamspeak3-server_linux_$_TSARCH/doc/" "$pkgdir/usr/share/doc/teamspeak3-server/"
    cp -a "teamspeak3-server_linux_$_TSARCH/sql/" "$pkgdir/usr/share/teamspeak3-server/"

    find "$pkgdir/usr/share/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/teamspeak3-server" -type f -exec chmod 644 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type f -exec chmod 644 {} \;

    chmod 750 "$pkgdir/var/lib/teamspeak3-server" \
              "$pkgdir/var/log/teamspeak3-server"
}
