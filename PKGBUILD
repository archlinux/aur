# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt
pkgver=6.9.2
pkgrel=1
pkgdesc="QT archiver utility"
arch=(i686 x86_64)
url=http://www.peazip.org/peazip-linux.html
license=(LGPL3)
depends=(balz desktop-file-utils lib32-{curl,gmp4,libx11,ncurses,qt4pas} p7zip upx zpaq)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
optdepends=(quad unace)
provides=(peazip)
conflicts=("peazip" "peazip-gtk2" "peazip-gtk2-build" "peazip-gtk2-portable" "peazip-qt-opensuse-latest" "peazip-qt-build")
options=('!strip')
install=peazip.install
source=("$pkgname-$pkgver.tgz"::"https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.LINUX.Qt.tgz"
        "peazip.desktop")
sha256sums=('b4f8e2bedeff52488dab4d641269103131038ff750e3b38d15f3ccad99797f8e'
            '4d876c6a61f25a7e2f3dfa69b1c80e61fdda9220bbf8e23a407e34eae377091b')


package() {
  _pkgres="$pkgdir/usr/lib/peazip/res"
  install -Dm755 "$srcdir/usr/local/share/PeaZip/peazip" \
                 "$pkgdir/usr/lib/peazip/peazip"

  cd "$srcdir/usr/local/share/PeaZip/res"
  for _file in altconf.txt lang/*.txt pea pealauncher rnd themes/{*.7z,*-embedded/*}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "$_pkgres/$_file"
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
