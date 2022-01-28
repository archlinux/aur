# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qtesseract5-git
pkgver=2.2.r2.40aecb5
pkgrel=1
pkgdesc='Convert the SUB/IDX subtiltes to SRT file. (GIT version)'
arch=('any')
url='https://forum.ubuntu-fr.org/viewtopic.php?pid=21507283'
license=('GPL3')
depends=('python-pyqt5'
         'tesseract'
         )
makedepends=('qt5-tools'
             'imagemagick'
             'git'
             )
optdepends=('ogmrip')
provides=('qtesseract5')
conflicts=('qtesseract5')
source=("git+https://github.com/Hizoka76/QTesseract5.git"
        'qtesseract5.svgz'
        )
sha256sums=('SKIP'
            '968b76c98b03234eaa306e2fa689ed7f1a81b02edf4c5717de196c16f449c596')

pkgver() {
  cd QTesseract5
  _ver="$(cat Qtesseract5.py | grep 'Qtesseract5.setApplicationVersion(' | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd QTesseract5
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
  cd QTesseract5
  sh build.sh
}

package() {
  cd QTesseract5
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/qtesseract5/Qtesseract5.py "${pkgdir}/usr/bin/qtesseract5"

  install -Dm755 Qtesseract5.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5.py"
  install -Dm644 Qtesseract5Ressources_rc.py "${pkgdir}/usr/share/qtesseract5/Qtesseract5Ressources_rc.py"
  install -Dm644 langcodes.py "${pkgdir}/usr/share/qtesseract5/langcodes.py"
  install -Dm644 Qtesseract5_en_EN.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_en_EN.qm"
  install -Dm644 Qtesseract5_fr_FR.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_fr_FR.qm"
  install -Dm644 Qtesseract5_cs_CZ.qm "${pkgdir}/usr/share/qtesseract5/Qtesseract5_cs_CZ.qm"
  install -Dm644 WhatsUp/WhatsUp.py "${pkgdir}/usr/share/qtesseract5/WhatsUp/WhatsUp.py"
  install -Dm644 man/qtesseract5.1 "${pkgdir}/usr/share/man/man1/qtesseract5.1"
  install -Dm644 man/qtesseract5.fr.1 "${pkgdir}/usr/share/man/fr/man1/qtesseract5.1"
  install -Dm644 qtesseract5.desktop "${pkgdir}/usr/share/applications/qtesseract5.desktop"

  install -Dm644 "${srcdir}/qtesseract5.svgz" "${pkgdir}/usr/share/pixmaps/qtesseract5.svgz"
}
