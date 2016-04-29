# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qtesseract5
pkgver=1.1
pkgrel=1
pkgdesc="Convert the SUB/IDX subtiltes to SRT file"
arch=('any')
url='http://forum.ubuntu-fr.org/viewtopic.php?id=1508741'
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
sha1sums=('2b40aa4ac56b7dc8d853c0617ed203d0d2395743')

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
  install -Dm644 ui_Qtesseract5.py "${pkgdir}/usr/share/qtesseract5/ui_Qtesseract5.py"
  install -Dm644 Qtesseract5_fr_FR.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_fr_FR.qm"
  install -Dm644 man/qtesseract5.1 "${pkgdir}/usr/share/man/man1/qtesseract5.1"

  (cd icons; for i in $(find . -name *.png -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/icons/hicolor/${i}"; done)
}
