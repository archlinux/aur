_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit), binary release"
pkgver=2.83.2
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
depends=(
	"enemy-territory-data"
	"lib32-mesa"
	"lib32-gcc-libs"
	"lib32-glibc"
	"lib32-glew"
)
makedepends=("imagemagick" "librsvg")
license=('GPL3')
source=(
    "etl_start.sh"
    "etlded_start.sh"
    "https://www.etlegacy.com/download/file/702"
    "https://github.com/etlegacy/etlegacy/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(
    '101f6755a6792825b5cd1982fd2ed890'
    '76d91573489900d41823a30b0920c784'
    '49ecb2b9d58d413ee4498b1de1798a1f'
    'ad15dacc96e38a59e108652c757de726'
)

package() {
    cd "$_pkgbase-v$pkgver-i386"
    install -dm 755 "${pkgdir}"/usr/{bin,lib/${_pkgbase}/,share/{applications,icons,licenses/${_pkgbase},/doc/${_pkgbase}}}
    cp -dr --no-preserve='ownership' ./ "${pkgdir}"/usr/lib/${_pkgbase}/
    # Executables
    install -Dm 755 "${srcdir}"/etl_start.sh "${pkgdir}"/usr/bin/etl.i386
    install -Dm 755 "${srcdir}"/etlded_start.sh "${pkgdir}"/usr/bin/etlded.i386
    # Incorrect permissions on install, fix
    chmod 755 -R "${pkgdir}"/usr/lib/"${_pkgbase}"/legacy/omni-bot
    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/

    for i in 16 22 24 32 48 64 128 256 512 1024; do
        magick -background none  ./icons/hicolor/scalable/apps/etl.svg -resize ${i}x${i} -colors 256 ./icons/etl.png
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
    sed -i 's/@BIN_DESCRIBE@/(32 bit)/g' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.service.in
    sed -i 's/@BIN_SUFFIX@/.i386/g' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.service.in
    install -m 644 "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.service.in $pkgdir/usr/lib/systemd/system/etlegacy-x86.service

    # config
    mv $pkgdir/usr/lib/$_pkgbase/etmain/*.cfg $pkgdir/etc/xdg/$_pkgbase/etmain/
    ln -s /etc/xdg/$_pkgbase/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_pkgbase/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_pkgbase-server
    ln -s /etc/xdg/$_pkgbase/etmain $pkgdir/var/lib/$_pkgbase-server/
}
