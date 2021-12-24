_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit), binary release"
pkgver=2.79.0
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
    "https://www.etlegacy.com/download/file/357"
    "https://github.com/etlegacy/etlegacy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
    'eafc5825eb9d03307e89cce74bd5603f03657daf29b215e3bd0575e2136b3cbe'
    '68133d626a343e2714fb839b2e054bf154b18c509bfa6e420899015c609cb153'
    '2984b5c2c5d22ceacad0a04f0019aeab8449bc2af028e6dce10f13c5862c9412'
    '73a59e5e1ca4f95638f9a924a5c150e1773a31e1f6cdea55684533f91e471eac'
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
    convert -background none  "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.svg -resize 64x64 -colors 256 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.ico

    # application entry
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.ico "${pkgdir}"/usr/share/icons/
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
