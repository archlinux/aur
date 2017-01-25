# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt
pkgver=6.3.0
pkgrel=1
pkgdesc="QT archiver utility"
arch=(i686 x86_64)
url=http://www.peazip.org/peazip-linux.html
license=(LGPL3)
depends=(balz desktop-file-utils lib32-{curl,gmp4,libx11,ncurses,qt4pas} p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=(${pkgname%-*})
conflicts=("${pkgname%-*}-gtk2" "${pkgname%-*}-qt-build")
install=${pkgname%-*}.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/${pkgname%-*}-$pkgver.LINUX.Qt.tgz"
        "http://www.peazip.org/downloads/additional/peazip_optional_formats_plugin-1.LINUX.INST.tar.gz"
        "${pkgname%-*}.desktop")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('d55a2134db7c1685b00af7d28f1a32128ff9206754c5ce8bc5097dba648b7ee5'
            '7f3fc1ea200d482500360eadda9298c4d5900ca822d21b5a0e11ff9de4d499ff'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')
sha512sums=('9fdf3fa1056f5f5152051ea38a558b626ab020974543e90b8326cbba16be2b5f5f308dc4eabc34d0a92410c0c389673c5cc37c532a0de928351356fc03847742'
            '8b308510a2c81ad2704cef19ed3fb2baf1dde0e123cf3e4c96e5e42a330e23002f3443c9fce009120492afc82b0ab063344c8029fe6fe851a4bea4814bacdaa8'
            'bc86d42b33285c2709081ddca7c06fe789cc2d42c69c4cbed595c077a776d91e5526eb799dcdc404375a3bfb212927165a02d3d79301f53adb8a89039bf7bb5f')

package() {
    _resdir="$pkgdir/usr/lib/${pkgname%-*}/res/"

    install -d "$pkgname/"
    cd "$pkgname/"
    bsdtar -xf "../$pkgname-$pkgver.tgz"
    mv "$srcdir"/res/* "$srcdir/$pkgname/usr/local/share/PeaZip/res"
    cd "$srcdir/$pkgname/usr/local/share/PeaZip/res"

    install -Dm755 "../${pkgname%-*}" "$pkgdir/usr/lib/${pkgname%-*}/${pkgname%-*}"

    for i in pea pealauncher rnd; do
        install -Dm755 "$i" "$_resdir/$i"
    done
    for i in arc/{arc,*.sfx}; do
        install -Dm755 "$i" "$_resdir/$i"
    done
    for i in altconf.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z} arc/arc.{ini,groups}; do
        install -Dm644 "$i" "$_resdir/$i"
    done

    install -d "$_resdir/7z/Codecs/"
    for i in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar29.so; do
        ln -sf "/usr/lib/p7zip/$i" "$_resdir/7z/$i"
    done
    for i in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
        install -d "$_resdir/$(dirname $i)/"
        ln -sf "/usr/bin/$(basename $i)" "$_resdir/$i"
    done
    install -d "$pkgdir/usr/bin/"
    for i in "/usr/lib/${pkgname%-*}"/{"${pkgname%-*}",res/pea,res/pealauncher}; do
        ln -sf "$i" "$pkgdir/usr/bin/$(basename $i)"
    done

    install -Dm644 "$srcdir/$pkgname/usr/local/share/icons/${pkgname%-*}.png" "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
    desktop-file-install --dir "$pkgdir/usr/share/applications/" "$srcdir/peazip-qt/opt/kde3/share/applications/kde/peazip.desktop"
}
