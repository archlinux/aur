# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=sumatrapdf
pkgver=3.5.2
pkgrel=1
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
            '9113c6a594fe9b2f2dc800345396c97c3516d42d40bbc1ace6b34d805c0a3d7b')

build() {
  wrestool -x -t 14 "SumatraPDF-${pkgver}-64.exe" > "${pkgname}.ico"
  convert "${pkgname}.ico" "$srcdir/$pkgname.png"
  rm $pkgname.ico

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SumatraPDF" --genericname "Application" --exec "/usr/bin/sumatrapdf" --icon "$srcdir/${pkgname}-3.png" --categories "Viewer;Wine;Graphics;Office" --mimetypes "application/pdf;application/epub+zip;application/x-mobipocket-ebook;image/vnd.djvu;image/vnd.djvu+multipage;application/vnd.ms-xpsdocument;application/oxps"
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

  echo "You may need MS fonts for non-latin characters."
}
