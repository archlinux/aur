# Maintainer: Funami
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=5.5.9
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
            'bdsup2subpp-git: SUP subtitle conversion'
            )
makedepends=('qt5-tools'
             'imagemagick'
             )
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
source=('https://github.com/Hizoka76/MKV-Extractor-Qt5/archive/c321f99cc00a89165a1f17b2c01a66a6bf6fbcd6.tar.gz'
        'move.patch')
sha256sums=('ba4ef604b7fff30ed4514b6019c1e76b2799a3065e1f523609a4256edb3f499e'
            '53e95957e08d459552364a8ff35ea2553388aaceaf091866c0bb9f3c2c1e43b4')

prepare() {
  cd MKV-Extractor-Qt5*
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh
  sed -e 's|/usr/share/icons/hicolor/scalable/apps/||g' \
      -i mkv-extractor-qt5.desktop

  # Patch: move: argument 1 has unexpected type 'float'
  patch --forward --strip=1 --input="${srcdir}/move.patch"

  # Use bdsup2subpp instead of java app
  sed 's|BDSup2Sub.jar|bdsup2subpp|g' -i MKVExtractorQt5.py

  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
  export IFS=' '
}

build() {
  cd MKV-Extractor-Qt5*
  sh ./build.sh
}

package() {
  cd MKV-Extractor-Qt5*
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/MKVExtractorQt5.py" "${pkgdir}/usr/bin/mkv-extractor-qt5"

  install -Dm644 CodecListFile.py "${pkgdir}/usr/share/${pkgname}/CodecListFile.py"
  install -Dm755 MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5.py"
  install -Dm644 MKVExtractorQt5_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5_cs_CZ.qm"
  install -Dm644 MKVExtractorQt5_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5_fr_FR.qm"
  install -Dm644 MKVExtractorQt5_es_ES.qm "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5_es_ES.qm"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/${pkgname}/MKVRessources_rc.py"
  install -Dm644 ui_MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/ui_MKVExtractorQt5.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom.py "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_cs_CZ.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_fr_FR.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_es_ES.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_es_ES.qm"
  install -Dm644 WhatsUp/WhatsUp.py "${pkgdir}/usr/share/${pkgname}/WhatsUp/WhatsUp.py"

  install -Dm644 mkv-extractor-qt5.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt5.desktop"

  install -Dm644 icons/mkv-extractor-qt5.svg "${pkgdir}/usr/share/pixmaps/mkv-extractor-qt5.svg"

  install -Dm644 man/mkv-extractor-qt5.1 "${pkgdir}/usr/share/man/man1/mkv-extractor-qt5.1"
  install -Dm644 man/mkv-extractor-qt5.fr.1 "${pkgdir}/usr/share/man/fr/man1/mkv-extractor-qt5.1"

  for i in img/*; do install -Dm644 ${i} "${pkgdir}/usr/share/${pkgname}/${i}"; done
}
