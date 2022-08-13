# Maintainer: Funami
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=22.08.08
_gitcommit=841e8d85e04591d7a9e96e93aedf835c9fe9715a
pkgrel=1
pkgdesc="Graphical MKV demultiplexer"
arch=('any')
url='http://forum.ubuntu-fr.org/viewtopic.php?id=1508741'
license=('GPL3')
depends=('python-pyqt5'
         'mkvtoolnix-cli')
makedepends=('qt5-tools'
             'imagemagick')
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'qtesseract5: subtitle conversion'
            'bdsup2subpp: SUP subtitle conversion')
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
source=("https://github.com/Hizoka76/MKV-Extractor-Qt5/archive/${_gitcommit}.tar.gz")
sha256sums=('fdcc029efe3e9c0f465ddd3025f0eee6b62923a26be668eed40178ae2b9f7137')

prepare() {
  cd "MKV-Extractor-Qt5-${_gitcommit}"

  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh
  sed -e 's|/usr/share/icons/hicolor/scalable/apps/||g' \
      -i mkv-extractor-qt5.desktop

  # Use bdsup2subpp instead of java app
  sed 's|BDSup2Sub.jar|bdsup2subpp|g' -i MKVExtractorQt5.py

  # fix version
  sed -e 's|app.setApplicationVersion("22.08.05")|app.setApplicationVersion("'"${pkgver}"'")|g' \
      -i MKVExtractorQt5.py

  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
}

build() {
  cd "MKV-Extractor-Qt5-${_gitcommit}"
  sh ./build.sh
}

package() {
  cd "MKV-Extractor-Qt5-${_gitcommit}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/MKVExtractorQt5.py" "${pkgdir}/usr/bin/mkv-extractor-qt5"

  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" MKVExtractorQt5.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" \
                 CodecListFile.py \
                 MKVRessources_rc.py \
                 ui_MKVExtractorQt5.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/Languages" \
                 Languages/MKVExtractorQt5_cs_CZ.qm \
                 Languages/MKVExtractorQt5_en_US.qm \
                 Languages/MKVExtractorQt5_es_ES.qm \
                 Languages/MKVExtractorQt5_fr_FR.qm
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom" \
                 QFileDialogCustom/QFileDialogCustom.py \
                 QFileDialogCustom/QFileDialogCustom_cs_CZ.qm \
                 QFileDialogCustom/QFileDialogCustom_es_ES.qm \
                 QFileDialogCustom/QFileDialogCustom_en_US.qm \
                 QFileDialogCustom/QFileDialogCustom_fr_FR.qm
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/WhatsUp" WhatsUp/WhatsUp.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/img" img/*

  install -Dm644 mkv-extractor-qt5.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 icons/mkv-extractor-qt5.svg -t "${pkgdir}/usr/share/pixmaps"

  install -Dm644 man/mkv-extractor-qt5.1 "${pkgdir}/usr/share/man/man1/mkv-extractor-qt5.1"
  install -Dm644 man/mkv-extractor-qt5.fr.1 "${pkgdir}/usr/share/man/fr/man1/mkv-extractor-qt5.1"
}
