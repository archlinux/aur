# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi-git
pkgver=3.1.2.r83.g79b04e50
pkgrel=1
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
makedepends=(
  'git'
  'python-setuptools'
)
depends=(
  'hyphen'
  'poppler'
  'python>=3.3'
  'python-ly>=0.9.5'
  'python-poppler-qt5'
  'python-pyqt5>=5.9'
  'python-pyqt5-webengine>=5.9'
  'python-pyqt5-sip>=5.9'
  'qpageview'
  'qt5-base>=5.9'
  'qt5-svg>=5.9'
  'qt5-webkit>=5.9'
  'hicolor-icon-theme'
  'tango-icon-theme'
)
optdepends=(
  'lilypond: Music engraving (recommended)'
# python-portmidi is currently a python2 package
#  'python-portmidi: MIDI playback (default engine)'
  'python-pygame: MIDI playback (alternate engine)'
  'portmidi: MIDI playback (fallback engine)'
  'hyphen-de: German hyphenation rules'
  'hyphen-en: English hyphenation rules'
  'hyphen-es: Spanish hyphenation rules'
  'hyphen-fr: French hyphenation rules'
  'hyphen-hu: Hungarian hyphenation rules'
  'hyphen-it: Italian hyphenation rules'
  'hyphen-nl: Dutch hyphenation rules'
  'hyphen-ro: Romanian hyphenation rules'
  'python-pycups: Printing to a local CUPS server'
)
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=("${pkgname}"::'git+https://github.com/frescobaldi/frescobaldi.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # Provided by tango-icon-theme
  rm -rf "frescobaldi_app/icons/Tango"
  # Provided by hyphen-*
  rm -f frescobaldi_app/hyphdicts/hyph_*.dic
  rm -f frescobaldi_app/hyphdicts/README*
}

build() {
  cd "${srcdir}/${pkgname}"
  make -C i18n
  make -C linux
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
