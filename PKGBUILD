# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-gtk2
pkgver=5.8.0
pkgrel=1
pkgdesc="GTK2 archiver utility"
arch=(i686 x86_64)
url=http://www.peazip.org/peazip-linux.html
license=(LGPL3)
depends=(balz desktop-file-utils lib32-curl lib32-gmp4 lib32-gtk2 lib32-ncurses lpaq paq8o p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=(${pkgname%-*})
conflicts=("${pkgname%-*}-qt" "${pkgname%-*}-qt-build")
install=${pkgname%-*}.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/${pkgname%-*}-$pkgver.LINUX.GTK2.tgz"
    ${pkgname%-*}.desktop)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('0234d2a0959079ef895970f84db9044308c7742a633f1fab92a5d82cf3e7375b'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')
sha512sums=('1ef298f5a0ce0947bdf98b792734501b2a8f02bfc2a06221bc12bfb8482bd1465f6ac6c8db1e210735d7b7a58008badbb25ee076446bdcc23a1c257321078263'
            'bc86d42b33285c2709081ddca7c06fe789cc2d42c69c4cbed595c077a776d91e5526eb799dcdc404375a3bfb212927165a02d3d79301f53adb8a89039bf7bb5f')

package() {
    _resdir="$pkgdir"/usr/lib/${pkgname%-*}/res/

    install -d $pkgname/
    cd $pkgname/
    bsdtar -xf ../$pkgname-$pkgver.tgz
    cd usr/local/share/PeaZip/res/

    install -Dm755 ../${pkgname%-*} "$pkgdir"/usr/lib/${pkgname%-*}/${pkgname%-*}

    for i in pea pealauncher rnd; do
        install -Dm755 $i "$_resdir"/$i
    done
    for i in arc/{arc,*.sfx}; do
        install -Dm755 $i "$_resdir"/$i
    done
    for i in altconf.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z} arc/arc.{ini,groups}; do
        install -Dm644 $i "$_resdir"/$i
    done

    install -d "$_resdir"/7z/Codecs/
    for i in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar29.so; do
        ln -sf /usr/lib/p7zip/$i "$_resdir"/7z/$i
    done
    for i in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
        install -d "$_resdir"/$(dirname $i)/
        ln -sf /usr/bin/$(basename $i) "$_resdir"/$i
    done
    install -d "$pkgdir"/usr/bin/
    for i in /usr/lib/${pkgname%-*}/{${pkgname%-*},res/pea,res/pealauncher}; do
        ln -sf $i "$pkgdir"/usr/bin/$(basename $i)
    done

    install -Dm644 "$srcdir"/$pkgname/usr/local/share/icons/${pkgname%-*}.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
    desktop-file-install "$srcdir"/${pkgname%-*}.desktop --dir "$pkgdir"/usr/share/applications/
}
