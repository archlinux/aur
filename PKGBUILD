# Maintainer: Funami
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Funkin-Stoopid <>

pkgname=mkv-extractor-qt
pkgver=26.04.29a
pkgrel=1
pkgdesc="Graphical MKV demultiplexer"
arch=('any')
url='https://github.com/Hizoka76/MKV-Extractor-Qt6'
license=('GPL3')
depends=('python-pyqt6'
         'mkvtoolnix-cli'
         'hicolor-icon-theme')
makedepends=('git'
             'qt6-tools')
optdepends=('ffmpeg: for DTS conversion'
            'mkclean: MKV optimisation'
            'mkvalidator: MKV check'
            'qtesseract5: subtitle conversion'
            'bdsup2subpp: SUP subtitle conversion')
conflicts=('mkv-extractor-gui')
replaces=('mkv-extractor-gui')
source=("${pkgname}-${pkgver}::git+https://github.com/Hizoka76/MKV-Extractor-Qt6.git#tag=v26.04.29")
sha256sums=('d5d83f7a626c03880c2ddf2fe83c962700099d52777881c78d6a094fd685ee2a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Remove absolute path for icon and use PNG
  sed -i 's|^Icon=.*|Icon=mkv-extractor-qt6.png|' mkv-extractor-qt6.desktop

  # Use bdsup2subpp instead of java app
  sed 's|BDSup2Sub.jar|bdsup2subpp|g' -i MKVExtractorQt6.py
}

build() {
  cd "${pkgname}-${pkgver}"

  # Compile translations
  /usr/lib/qt6/bin/lrelease Languages/*.ts QFileDialogCustom/*.ts

  # Generate Qt resources
  echo '<RCC>
  <qresource prefix="/">' > MKVRessources.qrc

  for icon in img/*
  do
    echo "    <file>${icon}</file>" >> MKVRessources.qrc
  done

  echo "    <file>icons/mkv-extractor-qt6.webp</file>" >> MKVRessources.qrc
  echo '  </qresource>
</RCC>' >> MKVRessources.qrc

  /usr/lib/qt6/rcc -g python MKVRessources.qrc -o MKVRessources_rc.py

  # Generate UI Python code
  /usr/lib/qt6/uic -g python ui_MKVExtractorQt6.ui -o ui_MKVExtractorQt6.py

  # Add default icons if they are missing from the theme
  for icon in img/*
  do
    nom=${icon##*/}
    nom=${nom%.*}
    sed -i "s@QtGui.QIcon.fromTheme(\"${nom}\")@QtGui.QIcon.fromTheme(\"${nom}\", QtGui.QIcon(\":/${icon}\"))@" ui_MKVExtractorQt6.py
  done

  # Compress man pages
  gzip -c man/mkv-extractor-qt6.1 > man/mkv-extractor-qt6.1.gz
  gzip -c man/mkv-extractor-qt6.fr.1 > man/mkv-extractor-qt6.fr.1.gz
}

package() {
  cd "${pkgname}-${pkgver}"
  local pkgtarget='mkv-extractor-qt6'

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgtarget}/MKVExtractorQt6.py" "${pkgdir}/usr/bin/mkv-extractor-qt6"

  install -Dm755 -t "${pkgdir}/usr/share/${pkgtarget}" MKVExtractorQt6.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}" \
                 CodecListFile.py \
                 CommandMixin.py \
                 CustomWidgets.py \
                 MKVRessources_rc.py \
                 MKVToolsMixin.py \
                 SoftwareMixin.py \
                 state.py \
                 TracksMixin.py \
                 ui_MKVExtractorQt6.py \
                 WorkMixin.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}/Languages" \
                 Languages/MKVExtractorQt6_cs_CZ.qm \
                 Languages/MKVExtractorQt6_de_DE.qm \
                 Languages/MKVExtractorQt6_en_US.qm \
                 Languages/MKVExtractorQt6_es_ES.qm \
                 Languages/MKVExtractorQt6_fr_FR.qm \
                 Languages/MKVExtractorQt6_it_IT.qm \
                 Languages/MKVExtractorQt6_tr_TR.qm
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}/QFileDialogCustom" \
                 QFileDialogCustom/QFileDialogCustom.py \
                 QFileDialogCustom/QFileDialogCustom_cs_CZ.qm \
                 QFileDialogCustom/QFileDialogCustom_de_DE.qm \
                 QFileDialogCustom/QFileDialogCustom_en_US.qm \
                 QFileDialogCustom/QFileDialogCustom_es_ES.qm \
                 QFileDialogCustom/QFileDialogCustom_fr_FR.qm \
                 QFileDialogCustom/QFileDialogCustom_it_IT.qm \
                 QFileDialogCustom/QFileDialogCustom_tr_TR.qm
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}/WhatsUp" WhatsUp/WhatsUp.py
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}/icons" icons/*
  install -Dm644 -t "${pkgdir}/usr/share/${pkgtarget}/img" img/*

  install -Dm644 mkv-extractor-qt6.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 icons/mkv-extractor-qt6.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 icons/mkv-extractor-qt6.webp -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

  install -Dm644 man/mkv-extractor-qt6.1.gz "${pkgdir}/usr/share/man/man1/mkv-extractor-qt6.1.gz"
  install -Dm644 man/mkv-extractor-qt6.fr.1.gz "${pkgdir}/usr/share/man/fr/man1/mkv-extractor-qt6.1.gz"
}
