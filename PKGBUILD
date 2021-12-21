# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=manuskript
pkgver=0.13.1
pkgrel=1
pkgdesc='Provides a rich environment to help writers create their first draft and then further refine and edit their masterpiece'
arch=('any')
url='https://www.theologeek.ch/manuskript/'
license=('GPL3')
depends=('hicolor-icon-theme' 'python-lxml' 'python-markdown' 'python-pyenchant' 'python-pyqt5'
         'qt5-svg')
optdepends=('qt5-webengine: preview PDF export'
            'pandoc: export to various formats'
            'pdfjs: preview PDF export')
source=("https://github.com/olivierkes/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'manuskript.appdata.xml')
sha256sums=('a90ad6197210539795507d238d17c001912225283ed2b8142380fac5a063bebf'
            '6b58aeec4b6d2c3e8ec0465f234f45b1ee5d489ea874229239f4e66ea8dfcdec')

prepare() {
  cd "$pkgname-$pkgver"

  # Unbundle pdfjs
  sed -i "s|\"+appPath('libs/pdf.js/web/viewer.html')|/usr/share/pdf.js/web/viewer.html\"|" manuskript/ui/views/PDFViewer.py
  rm -r libs/pdf.js

  # Use themed icon
  sed -i 's|Icon=.*|Icon=manuskript|' package/create_deb/manuskript.desktop

}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/share/manuskript/"
  cp -r manuskript icons i18n sample-projects resources "$pkgdir/usr/share/manuskript/"
  install -Dm755 package/create_deb/manuskript "$pkgdir/usr/bin/manuskript"
  install -Dm644 package/create_deb/manuskript.desktop "$pkgdir/usr/share/applications/manuskript.desktop"
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  install -Dm644 icons/Manuskript/manuskript.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/manuskript.svg"

  for i in 16 32 64 128 256 512; do
    install -Dm644 icons/Manuskript/icon-${i}px.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/manuskript.png"
  done
}
