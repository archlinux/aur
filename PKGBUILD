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
depends=(arc balz desktop-file-utils lib32-curl lib32-gmp4 lib32-gtk2 lib32-ncurses lpaq paq8o p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=("peazip" "peazip-gtk2")
conflicts=("peazip" "peazip-gtk2-build" "peazip-qt" "peazip-qt-build" "peazip-qt-opensuse-latest")
options=('!strip')
install=peazip.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.LINUX.GTK2.tgz"
        "peazip.desktop")
sha256sums=('bf48f5b15434bf8d8d497de6772aca46b0aa5384574357c29387874d58eca5e6'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')
sha512sums=('422e46b63a021504b0fb4203e450295585f9a627f5bf46effe40af1703ef4bcee6561dcb337385f66a49310ac221b73defb2db32537fbf04fba88a3d8aaa4b67'
            'bc86d42b33285c2709081ddca7c06fe789cc2d42c69c4cbed595c077a776d91e5526eb799dcdc404375a3bfb212927165a02d3d79301f53adb8a89039bf7bb5f')

package() {
  _pkgres="$pkgdir/usr/lib/peazip/res"
  install -Dm755 "$srcdir/usr/local/share/PeaZip/peazip" \
                 "$pkgdir/usr/lib/peazip/peazip"

  cd "$srcdir/usr/local/share/PeaZip/res"
  for _file in altconf.txt lang/*.txt pea pealauncher rnd; do
    install -Dm755 "$_file" "$_pkgres/$_file"
  done
  for _file in themes/{*.7z,*-embedded/*}; do
    install -Dm777 "$_file" "$_pkgres/$_file"
  done
  cd "$srcdir"

  ln -sf -T "/usr/lib/p7zip" "$_pkgres/7z"

  for _file in arc/{arc,marc} quad/{balz,quad} lpaq/lpaq8 paq/paq8o upx/upx unace/unace zpaq/zpaq; do
    install -d "$_pkgres/$(dirname $_file)/"
    ln -sf -T "/usr/bin/$(basename $_file)" "$_pkgres/$_file"
  done

  install -d "$pkgdir/usr/bin/"
  for _file in /usr/lib/peazip/{peazip,res/pea,res/pealauncher}; do
    ln -sf "$_file" "$pkgdir/usr/bin/$(basename $_file)"
  done

  install -Dm644 "$srcdir/usr/local/share/icons/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
  desktop-file-install "$srcdir/peazip.desktop" --dir "$pkgdir/usr/share/applications/"
}
