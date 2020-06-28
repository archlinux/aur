# Maintainer: Aloxaf <aloxafx at gmail dot com>
# Contributor: Mauricio López Coria <mauricio dot pronet at gmail dot com>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=7.3.1
pkgrel=2
pkgdesc="Natively compiled 64-bit GTK2 archiver utility, portable version with no dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=('gtk2' 'lib32-gcc-libs')
makedepends=('desktop-file-utils')
provides=('peazip')
conflicts=('peazip-gtk2' 'peazip-qt')
options=('!strip')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz")
sha256sums=('9b6e906425f49fa2cb989e2fc990a817327be68b41f009cc5454b5920ad756dc')

package() {
  _srcpea="$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2"
  _pkgres="$pkgdir/opt/$pkgname/res"
  install -D "$_srcpea/peazip" "$pkgdir/opt/$pkgname/peazip"
  install -D "$_srcpea/copying.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
  install -D "$_srcpea/peazip_help.pdf" "$pkgdir/opt/$pkgname/peazip_help.pdf"
  install -D "$_srcpea/FreeDesktop_integration/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
  cp "$_srcpea/FreeDesktop_integration/peazip-alt(multilingual).desktop" "$srcdir/peazip.desktop"

  # install resource
  cd "$_srcpea/res"
  install -d "$_pkgres/icons"
  install -d "$_pkgres/unace"
  find . -type f -exec install -D '{}' "$_pkgres/{}" \;

  # fix config path
  sed -i 's/same/appdata/' "$_pkgres/altconf.txt"

  # install KDE integration
  for file in $_srcpea/FreeDesktop_integration/kde4-dolphin/usr/share/kde4/services/ServiceMenus/*; do
    install -D $file "$pkgdir/usr/share/kservices5/PeaZip/$(basename $file)"
  done

  # set default language
  # lang=chs
  # _octal=$(stat -c "%a" "lang/$lang.txt")
  # install -Dm"${_octal}" "lang/$lang.txt" "$_pkgres/lang/default.txt"

  cd "$srcdir"

  # create symlink
  install -d "$pkgdir/usr/bin/"
  for _file in {peazip,res/pea}; do
    ln -sf "/opt/${pkgname}/$_file" "$pkgdir/usr/bin/$(basename "$_file")"
  done

  # install desktop file
  desktop-file-install -m 755 "$srcdir/peazip.desktop" --dir "$pkgdir/usr/share/applications/"
}
