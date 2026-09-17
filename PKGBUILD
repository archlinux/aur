# Maintainer: itonia149 <283548443+itonia149@users.noreply.github.com>
pkgname=local-pdf-reader
pkgver=1.0.0
pkgrel=1
pkgdesc='Local PDF.js reader in Microsoft Edge with browser-agent-readable page context'
arch=('any')
url='https://github.com/itonia149/local-pdf-reader'
license=('MIT' 'Apache-2.0')
depends=('python>=3.10' 'microsoft-edge-stable-bin' 'hicolor-icon-theme')
checkdepends=('desktop-file-utils')
optdepends=('kdialog: KDE file picker when opening the app without a PDF'
            'zenity: alternative GTK file picker'
            'xdg-utils: configure the default PDF application')
_pdfjsver=6.3.289
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "pdfjs-$_pdfjsver-dist.zip::https://github.com/mozilla/pdf.js/releases/download/v$_pdfjsver/pdfjs-$_pdfjsver-dist.zip")
noextract=("pdfjs-$_pdfjsver-dist.zip")
sha256sums=('e8168777ef4a206d0b2d3fd8b99e4c2b67926cf108f4ce06592db28dad3bb6ef'
            '98c5832ffe7af4edd59853476a478c0d4d4d76dd49c1701f4c86f7182725cdf9')

prepare() {
  # Keep the generic viewer pinned: its integration API is version-dependent.
  python -m zipfile -e "$srcdir/pdfjs-$_pdfjsver-dist.zip" \
    "$srcdir/$pkgname-$pkgver/vendor/pdfjs"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest discover -s tests -v
  desktop-file-validate packaging/local-pdf-reader.desktop
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -m644 reader_app.py open-pdf pdf-reader VERSION NOTICE \
    "$pkgdir/usr/share/$pkgname/"
  cp -r assets vendor "$pkgdir/usr/share/$pkgname/"
  # License and notices are retained; upstream sample PDFs/source maps are not runtime assets.
  find "$pkgdir/usr/share/$pkgname/vendor" -type f \( -name '*.map' -o -name '*.pdf' \) -delete
  install -Dm755 packaging/pdf-reader "$pkgdir/usr/bin/pdf-reader"
  install -Dm755 packaging/pdf-reader-server "$pkgdir/usr/bin/pdf-reader-server"
  install -Dm644 packaging/local-pdf-reader.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 assets/pdf-reader.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/pdfjs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/PDFJS-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
