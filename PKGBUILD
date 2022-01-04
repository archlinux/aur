# Maintainer: Christopher Arndt <chris at chrisarndt.de>

_pkgname=linux-show-player
pkgname="${_pkgname}-git"
pkgver=0.5.3.r278.39aba467
pkgrel=1
pkgdesc="Cue player designed for stage productions (git version)"
url="https://www.linux-show-player.org/"
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good' 'python-mido'
         'python-rtmidi' 'python-sortedcontainers' 'qt5-svg')
makedepends=('git' 'python-setuptools')
optdepends=('gst-libav: for larger format support'
            'ola: for Art-Net timecode support'
            'python-protobuf: for Art-Net timecode support'
            'portmidi: for portmidi support'
            'python-jack-client: for JACK output support')
options=('!emptydirs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/FrancescoCeruti/linux-show-player")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(python -c "exec(open('lisp/__init__.py').read()); print(__version__)")
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 dist/linuxshowplayer.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 dist/linuxshowplayer.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 dist/linuxshowplayer.xml -t "${pkgdir}/usr/share/mime/packages"
}
