_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
pkgver=2.77
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
provides=('etlegacy')
conflicts=('etlegacy')
backup=('usr/lib/etlegacy/etmain/etl_server.cfg'
        'usr/lib/etlegacy/etmain/legacy.cfg'
        'usr/lib/etlegacy/etmain/campaigncycle.cfg'
        'usr/lib/etlegacy/etmain/lmscycle.cfg'
        'usr/lib/etlegacy/etmain/mapvotecycle.cfg'
        'usr/lib/etlegacy/etmain/objectivecycle.cfg')
install=etlegacy.install
depends=("enemy-territory-data")
license=('GPL3')
source=(
    "etl_start.sh"
    "etlded_start.sh"
    "https://www.etlegacy.com/download/file/236"
    "https://github.com/etlegacy/etlegacy/archive/v$pkgver.tar.gz")
sha256sums=(
    'eafc5825eb9d03307e89cce74bd5603f03657daf29b215e3bd0575e2136b3cbe'
    '68133d626a343e2714fb839b2e054bf154b18c509bfa6e420899015c609cb153'
    '3092724eb05574fd8b8b3dc7fb9cf9b36bd68e00d590d98936cdb2e3ab82632b'
    '628016f3d0dc63409fb228acb4708b9a4a07a7b31eb5e4665841a6384d9dace4'
)

package() {
    cd "$_pkgbase-v$pkgver-i386"
    install -dm 755 "${pkgdir}"/usr/{bin,lib/${_pkgbase}/,share/{applications,icons,licenses/${_pkgbase},/doc/${_pkgbase}}}
    cp -dr --no-preserve='ownership' ./ "${pkgdir}"/usr/lib/${_pkgbase}/
    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/
    install -Dm 755 "${srcdir}"/etl_start.sh "${pkgdir}"/usr/bin/etl
    install -Dm 755 "${srcdir}"/etlded_start.sh "${pkgdir}"/usr/bin/etlded

    # application entry
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.ico "${pkgdir}"/usr/share/icons/
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/com.etlegacy.ETLegacy.desktop "${pkgdir}"/usr/share/applications/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_pkgbase
    mv $pkgdir/usr/lib/$_pkgbase/INSTALL.txt $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase
    mv $pkgdir/usr/lib/$_pkgbase/COPYING.txt $pkgdir/usr/share/licenses/$_pkgbase/
}
