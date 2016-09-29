# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qtesseract5
pkgver=2.0
pkgrel=1
pkgdesc="Convert the SUB/IDX subtiltes to SRT file"
arch=('any')
url='https://forum.ubuntu-fr.org/viewtopic.php?pid=21507283'
license=('GPL3')
depends=('python-pyqt5'
         'hicolor-icon-theme'
         'tesseract'
         'xdg-utils'
         )
makedepends=('qt5-tools'
             'imagemagick'
             )
optdepends=('ogmrip')
source=("https://launchpad.net/~hizo/+archive/ubuntu/mkv-extractor-gui/+files/qtesseract5_${pkgver}.orig.tar.gz"
        'qtesseract5.svgz'
        )
sha256sums=('fa9ec51e50c8c50367b305178e04fbb27dd2cac8abb8665a2666cfe7bc3b0fea'
            '968b76c98b03234eaa306e2fa689ed7f1a81b02edf4c5717de196c16f449c596'
            )

prepare() {
  sed -e 's|/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -e 's|/usr/lib/i386-linux-gnu/qt5/bin/lrelease|/usr/bin/lrelease-qt5|g' \
      -i build.sh

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
  ln -s /usr/share/qtesseract5/Qtesseract5.py "${pkgdir}/usr/bin/qtesseract5"


  install -Dm755 Qtesseract5.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5.py"
  install -Dm644 Qtesseract5Ressources_rc.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5Ressources_rc.py"
  install -Dm644 langcodes.py "${pkgdir}/usr/share/qtesseract5/langcodes.py"
  install -Dm644 Qtesseract5_en_EN.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_en_EN.qm"
  install -Dm644 Qtesseract5_fr_FR.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_fr_FR.qm"
  install -Dm644 WhatsUp/WhatsUp.py "${pkgdir}/usr/share/qtesseract5/WhatsUp/WhatsUp.py"
  install -Dm644 man/qtesseract5.1 "${pkgdir}/usr/share/man/man1/qtesseract5.1"
  install -Dm644 qtesseract5.desktop "${pkgdir}/usr/share/applications/qtesseract5.desktop"

  install -Dm644 "${srcdir}/qtesseract5.svgz" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/qtesseract5.svgz"
}
