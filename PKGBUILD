# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=6.0.1
pkgrel=2
pkgdesc="A free program for learning music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/"
license=('GPL')
depends=('portmidi' 'wxwidgets-gtk3' 'sqlite3' 'fluidsynth' 'soundfont-fluid')
optdepends=('timidity++: for sound without external midi player')
makedepends=('unittestpp' 'cmake' 'lsb-release')

source=("https://github.com/lenmus/lenmus/archive/Release_${pkgver}.tar.gz"
	   "0002-PortTime-included.patch")
sha256sums=('1fa5b8edc468c800598845aa809b4a4e93058ed13af40bfacd037c44d1c4bc1d'
            '7e23b83488bce81489f063dd59a625ed3fdd5be545e10cecd256794be80a2fcf')

prepare() {
  cd "$srcdir"/${pkgname}-Release_${pkgver}
  rm cmake-modules/FindSQLite3.cmake
  patch -p0 -i "$srcdir/0002-PortTime-included.patch"
}

build() {
  cd "$srcdir"

  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" \
		   -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-Release_${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
