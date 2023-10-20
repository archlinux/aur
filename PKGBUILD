# Maintainer: Birk Birkner <aur at bbirkner.de>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi-git
pkgver=3.3.0.r90.g1910c87c
pkgrel=1
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
makedepends=(
  'git'
  'python-build'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'python-tox'
  'desktop-file-utils'
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
  'python-qpageview'
  'qt5-base>=5.9'
  'qt5-svg>=5.9'
  'hicolor-icon-theme'
)
optdepends=(
  'lilypond: Music engraving (recommended)'
  'python-pygame: MIDI playback (alternate engine)'
  'hyphen-lang: hyphenation patterns for desired languages'
  'python-pycups: Printing to a local CUPS server'
)
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=("${pkgname}"::'git+https://github.com/frescobaldi/frescobaldi.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  #printf "%s.r%s.%s" "$(awk '/^version / {gsub(/"/,""); print $3}' frescobaldi_app/appinfo.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  tox -e mo-generate
  tox -e linux-generate
  # Provided by hyphen-*
  rm -f frescobaldi_app/hyphdicts/hyph_*.dic
  rm -f frescobaldi_app/hyphdicts/README*
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 frescobaldi_app/icons/org.frescobaldi.Frescobaldi.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/org.frescobaldi.Frescobaldi.svg
  desktop-file-install --dir $pkgdir/usr/share/applications/ --set-icon /usr/share/icons/hicolor/scalable/apps/org.frescobaldi.Frescobaldi.svg  linux/org.frescobaldi.Frescobaldi.desktop
}

# vim:set ts=2 sw=2 et:
