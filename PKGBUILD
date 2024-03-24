# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=sumatrapdf
pkgver=3.5.2
pkgrel=4
pkgdesc="PDF, eBook (epub, mobi), comic book (cbz/cbr), DjVu, XPS, CHM, image viewer for Windows. Small, fast, customizable, free."
arch=('x86_64')
url='https://www.sumatrapdfreader.org/free-pdf-reader'
license=('GPL3' 'BSD')
depends=('wine' 'bash')
optdepends=('ttf-ms-win11: or font data on a windows partiion'
            'ttf-ms-win11-auto: another choice')
makedepends=('imagemagick' 'gendesk' 'icoutils')
source=('https://www.sumatrapdfreader.org/dl/rel/3.5.2/SumatraPDF-3.5.2-64.zip'
        'https://raw.githubusercontent.com/sumatrapdfreader/sumatrapdf/3.5.2rel/COPYING.BSD'
        'sumatrapdf.sh')
sha256sums=('66ccb395c9184dce6822dfbb9970c877383b3ead6d9417b5106a844aac512989'
            'ff33648659aa06892ed13a731588a57006fafee2f848d35f70bf273a13cf9d27'
            '8cc7cff62ca0f4b149cff9ad5f383a38fa68627d1b80a5f5e631860ca95cd56c')

build() {
  wrestool -x -t 14 "SumatraPDF-${pkgver}-64.exe" > "${pkgname}.ico"
  convert "${pkgname}.ico" "$srcdir/$pkgname.png"
  rm $pkgname.ico
  mv "${pkgname}-3.png" "${pkgname}.png"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SumatraPDF"\
      --genericname "Application" --exec "/usr/bin/sumatrapdf"\
      --categories "Viewer;Wine;Graphics;Office"\
      --mimetypes "application/pdf;application/epub+zip;application/x-mobipocket-ebook;image/vnd.djvu;image/vnd.djvu+multipage;application/vnd.ms-xpsdocument;application/oxps"
}

package() {
  # license
  install -Dm644 COPYING.BSD "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.BSD"
  # binary and start script
  install -Dm755 "SumatraPDF-${pkgver}-64.exe" "$pkgdir/usr/share/$pkgname/sumatrapdf.exe"
  touch "$pkgdir/usr/share/$pkgname/SumatraPDF-settings.txt"
  install -Dm755 "$srcdir/sumatrapdf.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop entry
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

  echo "You may need MS fonts for non-latin characters."
}

# CHANGELOG
#
# 3.5.2-2
# - use `-appdata` cmd option of SumatraPDF.exe to specify config directory
#   - all old settings works fine
# - remove symlink in config directory to sumatrapdf.sh
#   - you can remove it
# - change WINEPREFIX to config directory
#   - you can delete ~/.sumatrapdf/
# 3.5.2-3, -4
# - fix desktop entry icon
