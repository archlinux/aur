_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit), binary release"
pkgver=2.80.2
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
    "https://www.etlegacy.com/download/file/410"
    "https://github.com/etlegacy/etlegacy/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(
    'f31746c1e62680f47d085919fe2cf8a8'
    '58fd6c4c81894309184af839e689bd2d'
    'a8c32bd1742be1884eb8898932960770'
    '995cc17a5c34516ba88310d5c6bb387a'
)

package() {
    cd "$_pkgbase-v$pkgver-i386"
    install -dm 755 "${pkgdir}"/usr/{bin,lib/${_pkgbase}/,share/{applications,icons,licenses/${_pkgbase},/doc/${_pkgbase}}}
    cp -dr --no-preserve='ownership' ./ "${pkgdir}"/usr/lib/${_pkgbase}/
    install -Dm 755 "${srcdir}"/etl_start.sh "${pkgdir}"/usr/bin/etl
    install -Dm 755 "${srcdir}"/etlded_start.sh "${pkgdir}"/usr/bin/etlded
    # Incorrect permissions on install, fix
    chmod 755 -R "${pkgdir}"/usr/lib/"${_pkgbase}"/legacy/omni-bot
    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/
    convert -background none  "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.svg -resize 64x64 -colors 256 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.png

    # application entry
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.png "${pkgdir}"/usr/share/icons/
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/com.etlegacy.ETLegacy.desktop "${pkgdir}"/usr/share/applications/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_pkgbase
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/docs/game/anticheat.html $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_pkgbase/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.conf $pkgdir/etc/xdg/$_pkgbase/
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.service $pkgdir/usr/lib/systemd/system/

    # config
    mv $pkgdir/usr/lib/$_pkgbase/etmain/*.cfg $pkgdir/etc/xdg/$_pkgbase/etmain/
    ln -s /etc/xdg/$_pkgbase/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_pkgbase/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_pkgbase-server
    ln -s /etc/xdg/$_pkgbase/etmain $pkgdir/var/lib/$_pkgbase-server/
}
