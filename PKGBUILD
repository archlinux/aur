# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-gtk2
pkgver=6.5.1
pkgrel=1
pkgdesc="GTK2 archiver utility"
arch=(i686 x86_64)
url=http://www.peazip.org/peazip-linux.html
license=(LGPL3)
depends=(balz desktop-file-utils lib32-curl lib32-gmp4 lib32-gtk2 lib32-ncurses lpaq paq8o p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=("peazip" "peazip-gtk2")
conflicts=("peazip" "peazip-gtk2-build" "peazip-qt" "peazip-qt-build" "peazip-qt-opensuse-latest")
options=('!strip')
install=peazip.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.LINUX.GTK2.tgz"
        "http://www.peazip.org/downloads/additional/peazip_optional_formats_plugin-1.LINUX.INST.tar.gz"
        "peazip.desktop")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('bf48f5b15434bf8d8d497de6772aca46b0aa5384574357c29387874d58eca5e6'
            '7f3fc1ea200d482500360eadda9298c4d5900ca822d21b5a0e11ff9de4d499ff'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')
sha512sums=('422e46b63a021504b0fb4203e450295585f9a627f5bf46effe40af1703ef4bcee6561dcb337385f66a49310ac221b73defb2db32537fbf04fba88a3d8aaa4b67'
            '8b308510a2c81ad2704cef19ed3fb2baf1dde0e123cf3e4c96e5e42a330e23002f3443c9fce009120492afc82b0ab063344c8029fe6fe851a4bea4814bacdaa8'
            'bc86d42b33285c2709081ddca7c06fe789cc2d42c69c4cbed595c077a776d91e5526eb799dcdc404375a3bfb212927165a02d3d79301f53adb8a89039bf7bb5f')

package() {
    _resdir="$pkgdir/usr/lib/peazip/res/"
    install -d "$pkgname"
    cd "$pkgname"
    bsdtar -xf ../$pkgname-$pkgver.tgz
    mv "$srcdir/res/"* "$srcdir/$pkgname/usr/local/share/PeaZip/res"

    cd "$srcdir/$pkgname/usr/local/share/PeaZip/res"
    install -Dm755 ../peazip "$pkgdir/usr/lib/peazip/peazip"
    for _file in pea pealauncher rnd arc/{arc,*.sfx}; do
      install -Dm755 "$_file" "$_resdir/$_file"
    done
    for _file in altconf.txt lang/* themes/{{nographic,ten}-embedded/*,*.7z} arc/arc.{ini,groups}; do
      install -Dm644 "$_file" "$_resdir/$_file"
    done

    install -d "$_resdir/7z/Codecs/"
    for _file in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar29.so; do
      ln -sf "/usr/lib/p7zip/$_file" "$_resdir/7z/$_file"
    done
    for _file in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
      install -d "$_resdir/$(dirname $_file)/"
      ln -sf "/usr/bin/$(basename $_file)" "$_resdir/$_file"
    done

    install -d "$pkgdir/usr/bin/"
    for _file in /usr/lib/peazip/{peazip,res/pea,res/pealauncher}; do
      ln -sf "$_file" "$pkgdir/usr/bin/$(basename $_file)"
    done

    install -Dm644 "$srcdir/$pkgname/usr/local/share/icons/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    desktop-file-install "$srcdir/peazip.desktop" --dir "$pkgdir/usr/share/applications/"
}
