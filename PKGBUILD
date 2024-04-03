# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard-git
pkgver=2.11
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64 x86_64_v3 i686)
url="https://github.com/metabrainz/picard"
license=(GPL-2.0-or-later)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-dateutil
  python-discid
  python-fasteners
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt5
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt5-multimedia: media player toolbar'
  'qt5-translations: full UI translation'
)
provides=("${pkgname%%-git}=$pkgver")
conflicts=('picard' 'picard-qt' 'picard-bzr')
source=('git+https://github.com/metabrainz/picard.git')
b2sums=('SKIP')
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

pkgver(){
  cd "${pkgname%%-git}"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%%-git}"
  pytest -vv
}

package() {
  cd "${pkgname%%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/${pkgname%%-git}/"
}
