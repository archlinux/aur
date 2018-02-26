# Maintainer: nyyu <mail@nyyu.tk>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: EnteEnteEnte <ducksource@duckpond.ch>

pkgname=teamspeak3-server
pkgver=3.1.1
pkgrel=1
pkgdesc='A proprietary VoIP conference software'
license=('custom')
arch=('i686' 'x86_64')
url="http://www.teamspeak.com"
depends=('glibc')
optdepends=('mariadb-connector-c: for MariaDB backend')
backup=(etc/teamspeak3-server.ini
        etc/tsdns_settings.ini)
install='teamspeak3-server.install'
source=('teamspeak3-server.ini'
        'teamspeak3-server.service'
        systemd_sysusers.d_${pkgname}.conf
        systemd_tmpfiles.d_${pkgname}.conf)
source_i686=("http://dl.4players.de/ts/releases/$pkgver/teamspeak3-server_linux_x86-$pkgver.tar.bz2")
source_x86_64=("http://dl.4players.de/ts/releases/$pkgver/teamspeak3-server_linux_amd64-$pkgver.tar.bz2")
sha256sums=('c678f5d657772920260c4ea4718677e6b00ef28ad74c317e05632a01d33b3ca5'
            '305926fdc4d202f47b81ddb332111c89bbd1c9a3e6f08c6f2cfcdcb49bcd5125'
            'edbaa5b5003653c8d75077f58b4a433731cf8b07035c067541744d09cba590fa'
            'c3ed9266e6e1322315995ad4e42704981ed2b6a50bbe9d4de2e04c315c643376')
sha256sums_i686=('7e1789b901c42ad7a54e1a6d15668e65d9bff6c466824bc5374d4aaaa58ead64')
sha256sums_x86_64=('c9403f7958e1bf1c5e5cf083641b1e02b06800158df543e09d9259c69181e873')

if [ "$CARCH" == "x86_64" ]; then
  _TSARCH='amd64'
elif [ "$CARCH" == "i686" ]; then
  _TSARCH='x86'
fi

package() {
    cd "$srcdir"

    install -Dm 644 teamspeak3-server.ini "$pkgdir/etc/teamspeak3-server.ini"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/tsdns/tsdns_settings.ini.sample" "$pkgdir/etc/tsdns_settings.ini"
    install -Dm 644 teamspeak3-server.service "$pkgdir/usr/lib/systemd/system/teamspeak3-server.service"
    install -Dm 644 systemd_sysusers.d_${pkgname}.conf "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 systemd_tmpfiles.d_${pkgname}.conf "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -Dm 755 "teamspeak3-server_linux_$_TSARCH/ts3server" "$pkgdir/usr/bin/ts3server"
    install -Dm 755 "teamspeak3-server_linux_$_TSARCH/tsdns/tsdnsserver" "$pkgdir/usr/bin/tsdnsserver"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_mariadb.so" "$pkgdir/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_sqlite3.so" "$pkgdir/usr/lib/libts3db_sqlite3.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/LICENSE" "$pkgdir/usr/share/licenses/teamspeak3-server/LICENSE"

    mkdir -p "$pkgdir/usr/share/doc/teamspeak3-server" \
             "$pkgdir/usr/share/teamspeak3-server"

    cp -a "teamspeak3-server_linux_$_TSARCH/doc/" "$pkgdir/usr/share/doc/teamspeak3-server/"
    cp -a "teamspeak3-server_linux_$_TSARCH/serverquerydocs/" "$pkgdir/usr/share/doc/teamspeak3-server/"
    cp -a "teamspeak3-server_linux_$_TSARCH/sql/" "$pkgdir/usr/share/teamspeak3-server/"

    find "$pkgdir/usr/share/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/teamspeak3-server" -type f -exec chmod 644 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/doc/teamspeak3-server" -type f -exec chmod 644 {} \;
}
