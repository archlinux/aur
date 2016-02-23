# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.0
pkgrel=1
pkgdesc="A modular turn-by-turn car navigation system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.navit-project.org/"
license=('GPL')
depends=('glu' 'freeglut' 'dbus-glib' 'cairo' 'imlib2' 'sdl_image' 'gtk2' 'gpsd' 'postgresql-libs')
optdepends=('cegui>=0.5.0: OpenGL gui' 'quesoglc: OpenGL gui')
makedepends=('cmake')
options=('!libtool')
install=navit.install
source=(https://github.com/navit-gps/navit/archive/v${pkgver/_/-}.tar.gz)
md5sums=('242f398e979a6b8c0f3c802b63435b68')

build() {
  cd "$srcdir/navit-${pkgver}"

  if [ $(grep -c '^SET(LIBDIR lib)' CMakeLists.txt) -ne 1 ]; then
    sed -i 's/^ENDIF (UNIX AND NOT ANDROID AND NOT APPLE)$/ENDIF (UNIX AND NOT ANDROID AND NOT APPLE)\nSET(LIB_DIR lib)/' CMakeLists.txt
  fi

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_LIBDIR=lib \
    -Dgraphics/opengl=TRUE \
    -DSAMPLE_MAP=FALSE
  make
}

package() {
  cd "$srcdir/navit-${pkgver}"
  make DESTDIR=${pkgdir} install
}

