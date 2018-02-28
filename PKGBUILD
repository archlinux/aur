# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt
pkgver=6.5.1
pkgrel=1
pkgdesc="QT archiver utility"
arch=(i686 x86_64)
url=http://www.peazip.org/peazip-linux.html
license=(LGPL3)
depends=(balz desktop-file-utils lib32-{curl,gmp4,libx11,ncurses,qt4pas} p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=(peazip)
conflicts=("peazip-gtk2" "peazip-qt-build")
options=('!strip')
install=peazip.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.LINUX.Qt.tgz"
        "http://www.peazip.org/downloads/additional/peazip_optional_formats_plugin-1.LINUX.INST.tar.gz"
        "http://www.peazip.org/downloads/additional/peazip_additional_formats_plugin-2.LINUX.ALL.tar.gz"
        "peazip.desktop")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('c812bfe387cafc78568fcdf97f536f7c3f1c036db07c68385e7fc947cfd7bc25'
            '7f3fc1ea200d482500360eadda9298c4d5900ca822d21b5a0e11ff9de4d499ff'
            '68afa72b6c53e756e6c26abd4b922c5b1188706aa1fe0979de0d611333e4bbb3'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')
sha512sums=('e0c37ee62c56a73bc96a427dfd9f71e950cff1a64e3c89b43c7f215791108665ff7bd9139e44ddb05dab611340b14e931cd48d04774d4814eacde36c2e6916cd'
            '8b308510a2c81ad2704cef19ed3fb2baf1dde0e123cf3e4c96e5e42a330e23002f3443c9fce009120492afc82b0ab063344c8029fe6fe851a4bea4814bacdaa8'
            'ead25542db8d5dc94ffb0334f3d78f61bc458119510da27c3e9b9b3a59d3106cde0675144df3dbb5ae061cbac093649fda49542637d8177bffda30236f32e0aa'
            'bc86d42b33285c2709081ddca7c06fe789cc2d42c69c4cbed595c077a776d91e5526eb799dcdc404375a3bfb212927165a02d3d79301f53adb8a89039bf7bb5f')

package() {
    _resdir="$pkgdir/usr/lib/peazip/res/"
    install -d "$pkgname"
    cd "$pkgname"
    bsdtar -xf "../$pkgname-$pkgver.tgz"
    mv -n "$srcdir/res/"* "$srcdir/lpaq/"* "$srcdir/paq/"* "$srcdir/quad/"* \
    -t "$srcdir/$pkgname/usr/local/share/PeaZip/res"

    cd "$srcdir/$pkgname/usr/local/share/PeaZip/res"
    install -Dm755 "../peazip" "$pkgdir/usr/lib/peazip/peazip"
    for _file in pea pealauncher rnd arc/{arc,*.sfx}; do
        install -Dm755 "$_file" "$_resdir/$_file"
    done
    for _file in altconf.txt lang/* themes/{{nographic,ten}-embedded/*,*.7z} arc/arc.{ini,groups}; do
        install -Dm644 "$_file" "$_resdir/$_file"
    done

    install -d "$_resdir/7z/Codecs"
    for _file in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar29.so; do
        ln -sf "/usr/lib/p7zip/$_file" "$_resdir/7z/$_file"
    done
    for _file in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
        install -d "$_resdir/$(dirname $_file)"
        ln -sf "/usr/bin/$(basename $_file)" "$_resdir/$_file"
    done

    install -d "$pkgdir/usr/bin"
    for _file in "/usr/lib/peazip"/{"peazip",res/pea,res/pealauncher}; do
        ln -sf "$_file" "$pkgdir/usr/bin/$(basename $_file)"
    done

    install -Dm644 "$srcdir/$pkgname/usr/local/share/icons/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    desktop-file-install --dir "$pkgdir/usr/share/applications/" "$srcdir/peazip-qt/opt/kde3/share/applications/kde/peazip.desktop"
}
