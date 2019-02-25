# Maintainer: Mauricio López Coria <mauricio dot pronet at gmail dot com>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=6.7.0
pkgrel=1
pkgdesc="Natively compiled 64-bit GTK2 archiver utility, portable version with no dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=(gtk2)
provides=('peazip')
conflicts=('peazip-gtk2' 'peazip-qt')
options=('!strip')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz")
sha256sums=('a99e31e4411bec1468faed08072765cdcd6bb017f6aea9374028772ab342bef4')

package() {
  _srcpea="$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2"
  _pkgres="$pkgdir/opt/$pkgname/res"
  install -Dm755 "$_srcpea/peazip" "$pkgdir/opt/$pkgname/peazip"
  install -Dm644 "$_srcpea/copying.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
  install -Dm644 "$_srcpea/peazip_help.pdf" "$pkgdir/usr/share/doc/$pkgname/peazip_help.pdf"
  install -Dm644 "$_srcpea/FreeDesktop_integration/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
  cp "$_srcpea/FreeDesktop_integration/peazip-alt(multilingual).desktop" "$srcdir/peazip.desktop"

  cd "$_srcpea/res"
  install -d "$_pkgres/icons"
  install -d "$_pkgres/unace"
  for _file in *.txt lang/*.txt pea* rnd 7z/{7z*,*.txt,Codecs/*} arc/* lang/* *paq/* quad/* themes/{*.7z,*-embedded/*} upx/*; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "$_pkgres/$_file"
  done
  cd "$srcdir"

  install -d "$pkgdir/usr/bin/"
  for _file in ${pkgdir}/opt/${pkgname}/{peazip,res/pea,res/pealauncher}; do
    ln -sf "$_file" "$pkgdir/usr/bin/$(basename "$_file")"
  done

  desktop-file-install -m 755 "$srcdir/peazip.desktop" --dir "$pkgdir/usr/share/applications/"

}
