# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=5.5.0
pkgrel=1
pkgdesc="Graphical MKV demultiplexer"
arch=('any')
url='http://forum.ubuntu-fr.org/viewtopic.php?id=1508741'
license=('GPL3')
depends=('python-pyqt5'
         'mkvtoolnix-cli'
         )
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'qtesseract5: subtitle conversion'
            )
makedepends=('qt5-tools'
             'imagemagick'
             )
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
source=("https://launchpad.net/~hizo/+archive/ubuntu/mkv-extractor-gui/+files/mkv-extractor-qt5_${pkgver}.orig.tar.gz")
sha256sums=('c35aac11a6dcf9128a2cca3be4646a7b4439b278b28b9e089a61da6d2f9844b4')

prepare() {
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh
  sed -e '/^Encoding/d' \
      -e 's|video/webm|video/webm;|g' \
      -e 's|audio/x-matroska;audio/x-matroska|audio/x-matroska|g' \
      -e 's|/usr/share/icons/hicolor/scalable/apps/||g' \
      -e 's|mkv-extractor-qt5|mkv-extractor-qt|g' \
      -i mkv-extractor-qt5.desktop

  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
  export IFS=' '
}

build() {
  make
}

package() {
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/MKVExtractorQt5.py" "${pkgdir}/usr/bin/mkv-extractor-qt"

  install -Dm644 CodecListFile.py "${pkgdir}/usr/share/${pkgname}/CodecListFile.py"
  install -Dm755 MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5.py"
  install -Dm644 MKVExtractorQt5_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5_cs_CZ.qm"
  install -Dm644 MKVExtractorQt5_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5_fr_FR.qm"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/${pkgname}/MKVRessources_rc.py"
  install -Dm644 ui_MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/ui_MKVExtractorQt5.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom.py "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_fr_FR.qm"
  install -Dm644 WhatsUp/WhatsUp.py "${pkgdir}/usr/share/${pkgname}/WhatsUp/WhatsUp.py"

  install -Dm644 mkv-extractor-qt5.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt.desktop"

  install -Dm644 icons/scalable/apps/mkv-extractor-qt5.svg "${pkgdir}/usr/share/pixmaps/mkv-extractor-qt.svg"

  install -Dm644 man/mkv-extractor-qt5.1 "${pkgdir}/usr/share/man/man1/mkv-extractor-qt.1"
  install -Dm644 man/mkv-extractor-qt5.fr.1 "${pkgdir}/usr/share/man/fr/man1/mkv-extractor-qt.1"
}
