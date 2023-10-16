# Maintainer: Christopher Arndt <chris at chrisarndt.de>

_pkgname=linux-show-player
pkgname=$_pkgname-git
pkgver=0.6.0.dev0.r641.6fae70f7
pkgrel=1
pkgdesc='Cue player designed for stage productions (git version)'
url='https://www.linux-show-player.org/'
arch=(any)
license=(GPL3)
depends=(
  gst-plugins-good
  python-appdirs
  python-falcon
  python-gobject
  python-humanize
  python-mido
  python-pyalsa
  python-pyliblo
  python-pyqt5
  python-requests
  python-rtmidi
  python-sortedcontainers
  qt5-svg
)
makedepends=(git python-build python-installer python-poetry python-wheel)
optdepends=(
  'gst-libav: for larger format support'
  'ola: for Art-Net timecode support'
  'python-protobuf: for Art-Net timecode support'
  'python-jack-client: for JACK output support'
)
options=('!emptydirs')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname::git+https://github.com/FrancescoCeruti/linux-show-player")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  grep '^__version' lisp/__init__.py > version.py
  local ver=$(python -c "exec(open('version.py').read()); print(__version__)")
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 dist/linuxshowplayer.desktop \
    -t "$pkgdir"/usr/share/applications
  install -Dm644 dist/linuxshowplayer.png \
    -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 dist/linuxshowplayer.xml \
    -t "$pkgdir"/usr/share/mime/packages
}
