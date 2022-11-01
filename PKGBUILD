# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mkv-extractor-qt-git
pkgver=22.08.30a.r28.bad90bb
pkgrel=1
pkgdesc='Graphical MKV demultiplexer. (GIT version)'
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
makedepends=('git'
             'qt5-tools'
             'imagemagick'
             )
conflicts=('mkv-extractor-qt')
replaces=('mkv-extractor-qt')
source=('git+https://github.com/Hizoka76/mkv-extractor-qt5.git')
sha256sums=('SKIP')

pkgver() {
  cd mkv-extractor-qt5
  _ver="$(cat MKVExtractorQt5.py | grep 'app.setApplicationVersion(' | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd mkv-extractor-qt5
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh
  sed -e 's|/usr/share/icons/hicolor/scalable/apps/||g' \
      -i mkv-extractor-qt5.desktop

  # Use bdsup2subpp instead of java app
  sed 's|BDSup2Sub.jar|bdsup2subpp|g' -i MKVExtractorQt5.py

  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
  export IFS=' '
}

build() {
  cd mkv-extractor-qt5
  sh ./build.sh
}

package() {
  cd mkv-extractor-qt5
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/MKVExtractorQt5.py" "${pkgdir}/usr/bin/mkv-extractor-qt5"

  install -Dm644 CodecListFile.py "${pkgdir}/usr/share/${pkgname}/CodecListFile.py"
  install -Dm755 MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/MKVExtractorQt5.py"
  install -Dm644 Languages/MKVExtractorQt5_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/Languages/Languages/MKVExtractorQt5_cs_CZ.qm"
  install -Dm644 Languages/MKVExtractorQt5_en_US.qm "${pkgdir}/usr/share/${pkgname}/Languages/MKVExtractorQt5_fr_US.qm"
  install -Dm644 Languages/MKVExtractorQt5_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/Languages/MKVExtractorQt5_fr_FR.qm"
  install -Dm644 Languages/MKVExtractorQt5_es_ES.qm "${pkgdir}/usr/share/${pkgname}/Languages/MKVExtractorQt5_es_ES.qm"
  install -Dm644 Languages/MKVExtractorQt5_tr_TR.qm "${pkgdir}/usr/share/${pkgname}/Languages/MKVExtractorQt5_tr_TR.qm"
  install -Dm644 MKVRessources_rc.py "${pkgdir}/usr/share/${pkgname}/MKVRessources_rc.py"
  install -Dm644 ui_MKVExtractorQt5.py "${pkgdir}/usr/share/${pkgname}/ui_MKVExtractorQt5.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom.py "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom.py"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_cs_CZ.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_cs_CZ.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_en_US.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_en_US.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_fr_FR.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_fr_FR.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_es_ES.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_es_ES.qm"
  install -Dm644 QFileDialogCustom/QFileDialogCustom_tr_TR.qm "${pkgdir}/usr/share/${pkgname}/QFileDialogCustom/QFileDialogCustom_tr_TR.qm"
  install -Dm644 WhatsUp/WhatsUp.py "${pkgdir}/usr/share/${pkgname}/WhatsUp/WhatsUp.py"

  install -Dm644 mkv-extractor-qt5.desktop "${pkgdir}/usr/share/applications/mkv-extractor-qt5.desktop"

  install -Dm644 icons/mkv-extractor-qt5.svg "${pkgdir}/usr/share/pixmaps/mkv-extractor-qt5.svg"

  install -Dm644 man/mkv-extractor-qt5.1 "${pkgdir}/usr/share/man/man1/mkv-extractor-qt5.1"
  install -Dm644 man/mkv-extractor-qt5.fr.1 "${pkgdir}/usr/share/man/fr/man1/mkv-extractor-qt5.1"

  for i in img/*; do install -Dm644 ${i} "${pkgdir}/usr/share/${pkgname}/${i}"; done
}
