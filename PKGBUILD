# Maintainer: nyyu <mail@nyyu.tk>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: EnteEnteEnte <ducksource@duckpond.ch>

pkgname=teamspeak3-server
pkgver=3.3.1
pkgrel=1
pkgdesc='A proprietary VoIP conference software'
license=('custom')
arch=('i686' 'x86_64')
url="http://www.teamspeak.com"
depends=('glibc' 'systemd>=235')
optdepends=('mariadb-connector-c: for MariaDB backend')
backup=(etc/teamspeak3-server.ini
        etc/tsdns_settings.ini)
install='teamspeak3-server.install'
source=('teamspeak3-server.ini'
        'teamspeak3-server.service')
source_i686=("http://dl.4players.de/ts/releases/$pkgver/teamspeak3-server_linux_x86-$pkgver.tar.bz2")
source_x86_64=("http://dl.4players.de/ts/releases/$pkgver/teamspeak3-server_linux_amd64-$pkgver.tar.bz2")
sha256sums=('2816cb8d699a08417e5f437dd3803135647dbdda6db012b68dac67b64d5763a8'
            '59f70e0942abe42145a13f47285c9fe67ec443b84cecd36f1986f57004766f3b')
sha256sums_i686=('13e0241740eeeb50840835bf15e16c423870d5107fae50164655c131a4152833')
sha256sums_x86_64=('b3891341a9ff4c4b6b0173ac57f1d64d4752550c95eeb26d2518ac2f5ca9fbc1')

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

    install -Dm 755 "teamspeak3-server_linux_$_TSARCH/ts3server" "$pkgdir/usr/bin/ts3server"
    install -Dm 755 "teamspeak3-server_linux_$_TSARCH/tsdns/tsdnsserver" "$pkgdir/usr/bin/tsdnsserver"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_mariadb.so" "$pkgdir/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3db_sqlite3.so" "$pkgdir/usr/lib/libts3db_sqlite3.so"
    install -Dm 644 "teamspeak3-server_linux_$_TSARCH/libts3_ssh.so" "$pkgdir/usr/lib/libts3_ssh.so"
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
