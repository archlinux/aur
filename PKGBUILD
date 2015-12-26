# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=5.3.0
pkgrel=2
pkgdesc="GUI for extract files from .mkv"
arch=('any')
url='http://hizo.fr/linux/mkv_extractor_gui'
license=('GPL3')
depends=('python-pyqt5'
         'mkvtoolnix-cli'
         'hicolor-icon-theme'
         )
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'tesseract: subtitle conversion'
            'ogmrip: subtitle conversion'
            )
makedepends=('qt5-tools')
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
source=("https://launchpad.net/~hizo/+archive/ubuntu/mkv-extractor-gui/+files/mkv-extractor-qt5_${pkgver}.orig.tar.gz"
        'mkv-extractor-qt.sh')
sha1sums=('57a08fc9ea9c1e45aea4d31490c74595fc769347'
          '3b65e4f11279403f044e054a852ef706b59787ed')
install=mkv-extractor-qt.install

prepare() {
  cd mkv-extractor-qt5
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e '/i386-linux-gnu/d' \
      -i build.sh
}

build() {
  cd mkv-extractor-qt5
  make
}

package() {
  install -Dm755 mkv-extractor-qt.sh "${pkgdir}/usr/bin/mkv-extractor-qt5"

  cd mkv-extractor-qt5

  install -Dm755 MKVExtractorQt.py "${pkgdir}/usr/share/mkv-extractor-qt/MKVExtractorQt.py"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/mkv-extractor-qt/MKVRessources_rc.py"
  install -Dm644 ui_MKVExtractorQt.py "${pkgdir}/usr/share/mkv-extractor-qt/ui_MKVExtractorQt.py"
  install -Dm644 MKVExtractorQt_cs_CZ.qm "${pkgdir}/usr/share/mkv-extractor-qt/MKVExtractorQt_cs_CZ.qm"
  install -Dm644 MKVExtractorQt_fr_FR.qm "${pkgdir}/usr/share/mkv-extractor-qt/MKVExtractorQt_fr_FR.qm"

  install -Dm644 mkv-extractor-qt.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt.desktop"

  (cd icons; for i in $(find . -name *.png -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/icons/hicolor/${i}"; done)
}
