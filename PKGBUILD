_title="etlegacy"
pkgname="$_title-static"
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server"
pkgver=2.75
pkgrel=2
arch=('x86_64')
url="http://www.etlegacy.com/"
license=('GPL3' 'custom')
makedepends=('cmake' 'zip')
depends=('alsa-lib' 'curl' 'enemy-territory-data' 'freetype2' 'glew' 'libjpeg-turbo' 'libvorbis' 'lua' 'minizip' 'openal' 'sdl2')
optdepends=('etlegacy-omnibot: artificial intelligence (AI) controlled opponent')
conflicts=('etlegacy' 'etlegacy-mod' 'etlegacy-git')
backup=('etc/xdg/etlegacy/etmain/etl_server.cfg'
            'etc/xdg/etlegacy/etmain/legacy.cfg'
            'etc/xdg/etlegacy/etmain/campaigncycle.cfg'
            'etc/xdg/etlegacy/etmain/lmscycle.cfg'
            'etc/xdg/etlegacy/etmain/mapvotecycle.cfg'
            'etc/xdg/etlegacy/etmain/objectivecycle.cfg')
install=etlegacy.install
source=("http://www.etlegacy.com/download/file/87"
        "etlegacy.desktop"
        "etl.svg"
        "etlegacy.service"
        "etlegacy.conf")
sha256sums=("494cf924d31640e32d5bfdaf7536be037d0861290362a86695de19b42beed227"
            "0f3f2ef4f232694235a510008d704a144aefc51ea8f8115860a253889b62a8e1"
            "381bb143af917512e72bf7f04ad6e64ed500b047c710054a5790f8f7dc9b9235"
            "1d146ed09ea620a1956002bf2b96d0569ea8435ed764f695e054cd16c201446e"
            "9c44ea758679b91964a2ac82ef8242d7d9c9421b64f7a9ad166dd2f5cb66e835")

package() {
    cd "$_title-v$pkgver-x86_64"

    mkdir -p $pkgdir/opt/$_title
    cp -rf * $pkgdir/opt/$_title

    rm -rf $pkgdir/opt/$_title/legacy/omni-bot

    ln -sf /usr/share/enemy-territory/etmain/* $pkgdir/opt/$_title/etmain

    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/$_title/etl $pkgdir/usr/bin/etl
    ln -sf /opt/$_title/etlded $pkgdir/usr/bin/etlded

    # config
    mkdir -p $pkgdir/etc/xdg/$_title/etmain
    install -m 644 $srcdir/etlegacy.conf $pkgdir/etc/xdg/$_title/

    # systemd
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 $srcdir/etlegacy.service $pkgdir/usr/lib/systemd/system/

    # server
    mkdir -p $pkgdir/usr/lib/etlegacy/etmain
    ln -sf /opt/etlegacy/etmain/* $pkgdir/usr/lib/etlegacy/etmain/

    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    ln -sf /opt/etlegacy/legacy/* $pkgdir/usr/lib/etlegacy/legacy/

    mkdir -p $pkgdir/var/lib/$_title-server/legacy
    mkdir -p $pkgdir/var/lib/$_title-server/etmain
    #ln -s /etc/xdg/$_title/etmain $pkgdir/var/lib/$_title-server/

    # config
    #mkdir -p $pkgdir/etc/xdg/$_title/etmain
    #mv $pkgdir/opt/$_title/misc/etmain/*.cfg $pkgdir/etc/xdg/$_title/etmain/
    #ln -s /etc/xdg/$_title/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/opt/$_title/etmain/

    # desktop files
    mkdir -p $pkgdir/usr/share/applications
    install -m 644 $srcdir/etlegacy.desktop $pkgdir/usr/share/applications

    mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
    install -m 644 $srcdir/etl.svg $pkgdir/usr/share/icons/hicolor/scalable/apps

    # geoip
    ln -s /usr/share/GeoIP/GeoIP.dat $pkgdir/opt/$_title/legacy
}
