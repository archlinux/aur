# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>

_name=Carla
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=2.5.1.r415.gdd092c74a
pkgrel=1
epoch=1
pkgdesc="Audio Plugin Host"
arch=(x86_64)
url='https://kx.studio/Applications:Carla'
license=(GPL2)
conflicts=($_pkgname)
provides=(
  $_pkgname
  clap-host
  dssi-host
  ladspa-host
  lv2-host
  vst3-host
  vst-host
)
depends=(
  alsa-lib
  gcc-libs
  glibc
  hicolor-icon-theme
  libglvnd
  libx11
  libxcursor
  libxrandr
  python-pyqt5
  qt5-base
  qt5-svg
)
makedepends=(
  file
  fluidsynth
  freetype2
  git
  liblo
  libsndfile
  qt5-tools
)
optdepends=(
  'jack: for using carla with JACK'
  'lv2-host: for the LV2 plugin'
  'vst-host: for the VST plugin'
  'python-pyliblo: OSC control support'
  'python-rdflib: LADSPA-RDF support'
)
groups=(pro-audio lv2-plugins vst-plugins)
source=("$_pkgname::git+https://github.com/falkTX/$_name.git")
md5sums=('SKIP')
changelog='changelog.txt'

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
  cd $_pkgname
  make features
  make \
    DEFAULT_QT=5 \
    HAVE_QT4=false
}

package() {
  depends+=(libasound.so libfluidsynth.so libfreetype.so libGL.so liblo.so libmagic.so
            libsndfile.so)
  cd $_pkgname
  make \
    DEFAULT_QT=5 \
    HAVE_QT4=false \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    install
}
