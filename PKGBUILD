_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
pkgver=2.77.1
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
    "https://www.etlegacy.com/download/file/257"
    "https://github.com/etlegacy/etlegacy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
    'eafc5825eb9d03307e89cce74bd5603f03657daf29b215e3bd0575e2136b3cbe'
    '68133d626a343e2714fb839b2e054bf154b18c509bfa6e420899015c609cb153'
    '5b988cb5f708e55d4ef7eee151352b82b56855d78ce50498f4b47c44e07550b1'
    '730a8a52435884b922d8c280fcdeace648902399798c7a973da72fbc4163ebe2'
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
