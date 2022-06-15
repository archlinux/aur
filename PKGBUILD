# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=manuskript
pkgver=0.14.0
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
source=("https://github.com/olivierkes/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5d7326e4f9941e83a74e186d502c82306b8ae66dccf806bf0bc016e0e933d0ae')

prepare() {
  cd "$pkgname-$pkgver"

  # Unbundle pdfjs
  sed -i "s|\"+appPath('libs/pdf.js/web/viewer.html')|/usr/share/pdf.js/web/viewer.html\"|" manuskript/ui/views/PDFViewer.py
  rm -r libs/pdf.js

  # Use themed icon
  sed -i 's|Icon=.*|Icon=manuskript|' resources/ch.theologeek.Manuskript.desktop
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/share/manuskript/"
  cp -r manuskript icons i18n sample-projects resources "$pkgdir/usr/share/manuskript/"
  install -Dm755 package/create_deb/manuskript "$pkgdir/usr/bin/manuskript"
  install -Dm644 resources/ch.theologeek.Manuskript.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 resources/ch.theologeek.Manuskript.appdata.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 icons/Manuskript/manuskript.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/manuskript.svg"

  for i in 16 32 64 128 256 512; do
    install -Dm644 icons/Manuskript/icon-${i}px.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/manuskript.png"
  done
}
