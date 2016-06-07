# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=5.4.2
pkgrel=1
pkgdesc="Graphical mkv demultiplexer"
arch=('any')
url='http://forum.ubuntu-fr.org/viewtopic.php?id=1508741'
license=('GPL3')
depends=('python-pyqt5'
         'mkvtoolnix-cli'
         'hicolor-icon-theme'
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
sha1sums=('4bc9d62a08ddfcdef735dac7db1a7cb45425b6e8')

prepare() {
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh
  sed -e '/Encoding/d' \
      -e 's|video/webm|video/webm;|g' \
      -e 's|audio/x-matroska;audio/x-matroska|audio/x-matroska|g' \
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
  ln -s /usr/share/mkv-extractor-qt5/MKVExtractorQt5.py "${pkgdir}/usr/bin/mkv-extractor-qt5"

  install -Dm644 CodecListFile.py "${pkgdir}/usr/share/mkv-extractor-qt5/CodecListFile.py"
  install -Dm755 MKVExtractorQt5.py "${pkgdir}/usr/share/mkv-extractor-qt5/MKVExtractorQt5.py"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/mkv-extractor-qt5/MKVRessources_rc.py"
  install -Dm644 MKVExtractorQt5_cs_CZ.qm "${pkgdir}/usr/share/mkv-extractor-qt5/MKVExtractorQt5_cs_CZ.qm"
  install -Dm644 MKVExtractorQt5_fr_FR.qm "${pkgdir}/usr/share/mkv-extractor-qt5/MKVExtractorQt5_fr_FR.qm"
  install -Dm644 ui_MKVExtractorQt5.py "${pkgdir}/usr/share/mkv-extractor-qt5/ui_MKVExtractorQt5.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom.py "${pkgdir}/usr/share/mkv-extractor-qt5/QFileDialogCustom/QFileDialogCustom.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_fr_FR.qm "${pkgdir}/usr/share/mkv-extractor-qt5/QFileDialogCustom/QFileDialogCustom_fr_FR.qm"

  install -Dm644 mkv-extractor-qt5.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt5.desktop"

  install -Dm644 icons/scalable/apps/mkv-extractor-qt5.svgz "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mkv-extractor-qt5.svgz"
}
