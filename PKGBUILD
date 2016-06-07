# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qtesseract5
pkgver=1.2
pkgrel=2
pkgdesc="Convert the SUB/IDX subtiltes to SRT file"
arch=('any')
url='https://forum.ubuntu-fr.org/viewtopic.php?pid=21507283'
license=('GPL3')
depends=('python-pyqt5'
         'hicolor-icon-theme'
         'tesseract'
         'ogmrip'
         )
makedepends=('qt5-tools'
             'imagemagick'
             )
source=("https://launchpad.net/~hizo/+archive/ubuntu/mkv-extractor-gui/+files/qtesseract5_${pkgver}.orig.tar.gz")
sha1sums=('49d352c12ab9b1739dfa627999f8339bca327f5e')

prepare() {
  cd qtesseract5
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
  cd qtesseract5
  make
}

package() {
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/qtesseract5/Qtesseract5.py "${pkgdir}/usr/bin/qtesseract5"

  cd qtesseract5

  install -Dm755 Qtesseract5.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5.py"
  install -Dm644 Qtesseract5Ressources_rc.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5Ressources_rc.py"
  install -Dm644 Qtesseract5_fr_FR.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_fr_FR.qm"
  install -Dm644 man/qtesseract5.1 "${pkgdir}/usr/share/man/man1/qtesseract5.1"

  install -Dm644 icons/scalable/apps/qtesseract5.svgz "${pkgdir}/usr/share/icons/hicolor/scalable/apps/qtesseract5.svgz"
}
