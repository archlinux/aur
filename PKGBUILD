# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Funkin-Stoopid <>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=5.2.2
pkgrel=2
pkgdesc="GUI for extract files from .mkv"
arch=('any')
url='http://hizo.fr/linux/mkv_extractor_gui'
license=('GPL3')
depends=('python-pyqt5'
         'mkvtoolnix-cli'
         'hicolor-icon-theme')
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'tesseract: subtitle conversion'
            'ogmrip: subtitle conversion')
makedepends=('qt5-tools')
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
install="${pkgname}.install"
source=("https://launchpad.net/~hizo/+archive/ubuntu/mkv-extractor-gui/+files/mkv-extractor-qt5_${pkgver}.orig.tar.gz")
sha1sums=('6cf50119f9b49a2d8060b0652f5831b051da9788')

build() {
  cd mkv-extractor-qt5
  ./build.sh
  lrelease-qt5 *.ts
}

package() {
  cd mkv-extractor-qt5

  # Create binary mkv-extractor-qt
  echo "#!/bin/bash" > mkv-extractor-qt
  echo "/usr/share/${pkgname}/MKVExtractorQt.py \"\${@}\"" >> mkv-extractor-qt

  # Install binaries and data files
  install -Dm755 MKVExtractorQt.py "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt.py"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/${pkgname}/MKVRessources_rc.py"
  install -Dm644 ui_MKVExtractorQt.py "${pkgdir}/usr/share/${pkgname}/ui_MKVExtractorQt.py"
  install -Dm644 MKVExtractorQt_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt_cs_CZ.qm"
  install -Dm644 MKVExtractorQt_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt_fr_FR.qm"

  # Install the .desktop file
  install -Dm644 mkv-extractor-qt.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt.desktop"

  # Install the icon file
  (cd icons; for i in $(find . -name *.png -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/icons/hicolor/${i}"; done)

  # Install binary file
  install -Dm755 mkv-extractor-qt "${pkgdir}/usr/bin/mkv-extractor-qt"
}
