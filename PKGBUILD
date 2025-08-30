pkgname='flightgear'
pkgver=2024.1.1
_pkgver=v2024.1.1
pkgrel=2
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
depends=('openxr' 'qt5-declarative' 'qt6-declarative' 'qt5-base' 'zlib' 'openscenegraph' 'openal' 'simgear')
makedepends=('cmake' 'boost174' 'qt5-svg' 'plib')
optdepends=('flightgear-data: Base data package')
license=("GPL-2.0-or-later")
url="http://www.flightgear.org/"
source=("https://gitlab.com/flightgear/flightgear/-/archive/${_pkgver}/flightgear-${_pkgver}.tar.gz"
        "fix-openal-header.patch")
sha256sums=('8a5410d7894d942bd2feed60c09d601bc46a670707ded771c6daf6ee7114655a'
            '1869a10b8e6cd39128ec07115daeef01a6f586926bd4e1e8c4253426f885d1a7')

prepare() {
  mv $srcdir/flightgear-${_pkgver} $srcdir/flightgear
  cd $srcdir/flightgear
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
  cd $srcdir/flightgear
  patch -p1 -i $srcdir/fix-openal-header.patch
}

build() {
  mkdir -p $srcdir/fgbuild
  cd $srcdir/fgbuild
  cmake ../flightgear \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFG_DATA_DIR=/usr/share/flightgear/data \
    -DBoost_DIR=/opt/boost-1.74.0/lib/cmake/Boost-1.74.0
  make
}

package() {
  cd $srcdir/fgbuild
  make DESTDIR=$pkgdir install
}
