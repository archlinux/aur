# Maintainer: Berrit Birkner <aur at bbirkner.de>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi-git
pkgver=4.0.3.r15.g3c19c693
pkgrel=1
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL-2.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
  'python-tox'
  'desktop-file-utils'
  'gettext'
)
depends=(
  'hyphen'
  'python'
  'python-ly'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-qpageview'
  'qt6-base'
  'qt6-svg'
  'hicolor-icon-theme'
)
optdepends=(
  'lilypond: Music engraving (recommended)'
  'python-pygame: MIDI playback (alternate engine)'
  'portmidi: MIDI playback'
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
  rm -f frescobaldi/hyphdicts/hyph_*.dic
  rm -f frescobaldi/hyphdicts/README*
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 frescobaldi/icons/org.frescobaldi.Frescobaldi.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/org.frescobaldi.Frescobaldi.svg
  desktop-file-install --dir $pkgdir/usr/share/applications/ --set-icon /usr/share/icons/hicolor/scalable/apps/org.frescobaldi.Frescobaldi.svg  linux/org.frescobaldi.Frescobaldi.desktop
}

# vim:set ts=2 sw=2 et:
