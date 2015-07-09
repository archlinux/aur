# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Funkin-Stoopid <>
# Contributor: Funkin-Stoopid <>
pkgname=mkv-extractor-qt
pkgver=5.2.1
pkgrel=1
pkgdesc="GUI for extract files from .mkv"
arch=('any')
url="http://hizo.fr/linux/mkv_extractor_gui"
license=('GPL3')
depends=('python-pyqt4' 'mkvtoolnix-cli')
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'tesseract: subtitle conversion'
            'ogmrip: subtitle conversion')
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
install="${pkgname}.install"
source=("http://hizo.fr/linux/mkv_extractor_gui/MKV-Extractor-Qt_sources_${pkgver}.tar.gz"
        'mkv-extractor-qt.desktop')
sha1sums=('da22ccbd748752034455e3173284e67005632d5f'
          '8036a3af674b1d3050ebd65c3838a4a3519b6a09')
noextract=("MKV-Extractor-Qt_sources_${pkgver}.tar.gz")

prepare() {
  mkdir -p build
  cd build
  bsdtar -xf "../MKV-Extractor-Qt_sources_${pkgver}.tar.gz"
}

build() {
  cd build
  ./build.sh
}

package() {

  cd build

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
  install -Dm644 ../mkv-extractor-qt.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt.desktop"

  # Install the icon file
  install -Dm644 img/mkv-extractor-qt.png "${pkgdir}/usr/share/pixmaps/mkv-extractor-qt.png"

  # Install binary file
  install -Dm755 mkv-extractor-qt "${pkgdir}/usr/bin/mkv-extractor-qt"
}