_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit), binary release"
pkgver=2.81.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
provides=('etlegacy')
conflicts=('etlegacy' 'etlegacy32-mod')
backup=('etc/xdg/etlegacy/etmain/etl_server.cfg'
        'etc/xdg/etlegacy/etmain/legacy.cfg'
        'etc/xdg/etlegacy/etmain/campaigncycle.cfg'
        'etc/xdg/etlegacy/etmain/lmscycle.cfg'
        'etc/xdg/etlegacy/etmain/mapvotecycle.cfg'
        'etc/xdg/etlegacy/etmain/objectivecycle.cfg'
        'etc/xdg/etlegacy/etlegacy.conf')
install=etlegacy.install
depends=("enemy-territory-data")
makedepends=("imagemagick")
license=('GPL3')
source=(
    "etl_start.sh"
    "etlded_start.sh"
    "https://www.etlegacy.com/download/file/539"
    "https://github.com/etlegacy/etlegacy/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(
    '5dc7a1fe4129a7ca2dd4b1dc15b0ae4d'
    'f63392f27b823020dfbce3150e9adf53'
    'f3a7daf81754785b2c888c3f6d15e36e'
    '37260857118dc97aec1b37fafed7e7fb'
)

package() {
    cd "$_pkgbase-v$pkgver-i386"
    install -dm 755 "${pkgdir}"/usr/{bin,lib/${_pkgbase}/,share/{applications,icons,licenses/${_pkgbase},/doc/${_pkgbase}}}
    cp -dr --no-preserve='ownership' ./ "${pkgdir}"/usr/lib/${_pkgbase}/
    # Executables
    install -Dm 755 "${srcdir}"/etl_start.sh "${pkgdir}"/usr/bin/etl.x86
    install -Dm 755 "${srcdir}"/etlded_start.sh "${pkgdir}"/usr/bin/etlded.x86
    # Incorrect permissions on install, fix
    chmod 755 -R "${pkgdir}"/usr/lib/"${_pkgbase}"/legacy/omni-bot
    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/

    for i in 16 22 24 32 48 64 128 256 512 1024; do
        convert -background none  ./icons/hicolor/scalable/apps/etl.svg -resize ${i}x${i} -colors 256 ./icons/etl.png
        install -Dvm644 ./icons/etl.png \
          "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/etl.png"
    done

    install -Dvm644 ./icons/hicolor/scalable/apps/etl.svg \
          "$pkgdir/usr/share/icons/hicolor/scalable/apps/etl.svg"

    # manpages
    cp -dr --no-preserve='ownership' "./man" "${pkgdir}"/usr/share/

    # applications
    cp -dr --no-preserve='ownership' "./applications" "${pkgdir}"/usr/share/

    #licenses
    cp -dr --no-preserve='ownership' "./licenses" "${pkgdir}"/usr/share/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_pkgbase
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/docs/game/anticheat.html $pkgdir/usr/share/doc/$_pkgbase/

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_pkgbase/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.conf $pkgdir/etc/xdg/$_pkgbase/
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy-x86.service $pkgdir/usr/lib/systemd/system/

    # config
    mv $pkgdir/usr/lib/$_pkgbase/etmain/*.cfg $pkgdir/etc/xdg/$_pkgbase/etmain/
    ln -s /etc/xdg/$_pkgbase/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_pkgbase/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_pkgbase-server
    ln -s /etc/xdg/$_pkgbase/etmain $pkgdir/var/lib/$_pkgbase-server/
}
