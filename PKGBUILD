# Original Packager: KaMeHb-UA <marlock@etlgr.com>

pkgname=yaware-timetracker
pkgver=2.0.5
pkgrel=22
pkgdesc='Yaware.TimeTracker'
arch=('x86_64')
license=('custom')
depends=('mesa' 'libsm' 'libx11' 'libxss' 'zlib' 'glib2' 'libxml2' 'dbus' 'fontconfig' 'freetype2' 'libxcb' 'libxext' 'libxi' 'libxrender')

source=('http://repo.yaware.com/deb/pool/main/yaware_2.0.5-22_amd64.deb')

sha256sums=('50a26311c155df46a2aef04bdc4ddd0435cab499e443588b7195b1e8df3c8822')
sha384sums=('2ceb935cbe97a4afbcdf0bcf1a3ac8439dcfd30dbceecd89e6c0013ba8909430896b5f69c077a41fd43435d157462380')
sha512sums=('103d01f9068d62d5df207a529299598990852458322614c3259055f7f5b3138617de34bce020da8f7accc11ffd9d62f4d77989d275f09ce5dcf39f2d6bf539c4')

package() {
    # unpack
    bsdtar -xzf data.tar.gz -C "$pkgdir/"

    # opt dir rights
    chmod 755 "$pkgdir/opt"

    # logs
    mkdir -p "$pkgdir/var/log/ywtracker"
    chmod -R 777 "$pkgdir/var/log/ywtracker"

    # binaries
    bindir="$pkgdir/opt/ywtracker/bin"
    tbindir="$pkgdir/usr/bin"
    mkdir -p "$tbindir"
    chmod +x "$bindir/ywclient.sh"
    ln -s "$bindir/ywclient.sh" "$tbindir/ywclient"
    chmod +x "$bindir/ywservice.sh"
    ln -s "$bindir/ywservice.sh" "$tbindir/ywservice"
    chmod +x "$bindir/ywutility.sh"
    ln -s "$bindir/ywutility.sh" "$tbindir/ywutility"

    # config
    cat > "$pkgdir/opt/ywtracker/bin/config.ini" << CONFIGDATA
[General]
accountKey=
aboutUrl.en=http://www.yaware.com/?utm_source=software_client&utm_medium=software_mainmenu&utm_campaign=client_mainmenu
aboutUrl.ru=http://www.yaware.ru/?utm_source=software_client&utm_medium=software_mainmenu&utm_campaign=client_mainmenu
aboutUrl.ua=http://www.yaware.com.ua/?utm_source=software_client&utm_medium=software_mainmenu&utm_campaign=client_mainmenu
feedbackUrl=http://timetracker.yaware.com/pomogite-nam-stat-luchshe/?accountId=%s&clientVersion=%s
helpInstallUrl.en=http://www.yaware.com.ua/yaware-help/help/yaware-client-install/install-from-catalogue/
helpInstallUrl.ru=http://www.yaware.ru/yaware-help/help/yaware-client-install/install-from-catalogue/
helpInstallUrl.ua=http://www.yaware.com.ua/yaware-help/help/yaware-client-install/install-from-catalogue/
publicSiteUrl.en=http://www.yaware.com
publicSiteUrl.ru=http://www.yaware.ru
publicSiteUrl.ua=http://www.yaware.com.ua
registerUrl=http://www.yaware.com/app/register?needkey=1#register
server=data1.yaware.com/api/v5
restServer=data-api.yaware.com
CONFIGDATA
    chmod 666 "$pkgdir/opt/ywtracker/bin/config.ini"

    # autostart
    XDG_AUTOSTART_DIR="$pkgdir/etc/xdg/autostart"
    mkdir -p "$XDG_AUTOSTART_DIR"
    cp -f "$pkgdir/opt/ywtracker/resources/ywtracker.desktop" "$XDG_AUTOSTART_DIR"
    chmod 777 "$XDG_AUTOSTART_DIR/ywtracker.desktop"
}
