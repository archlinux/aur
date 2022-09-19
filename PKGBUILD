# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=6.0.0
pkgrel=3
pkgdesc="A free program for learning music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/"
license=('GPL')
depends=('portmidi' 'wxwidgets-gtk3' 'sqlite3' 'fluidsynth' 'soundfont-fluid')
optdepends=('timidity++: for sound without external midi player')
makedepends=('unittestpp' 'cmake' 'lsb-release')

source=("https://github.com/lenmus/lenmus/archive/Release_${pkgver}.tar.gz"
		"0001-FindPortMidi.patch"
		"0001-Fix-SetHTMLBackgroundImage.patch")
sha256sums=('235a44a04e827fb9a118073ffcc92dc3714df073b7c67e915b860d3a8480e4fd'
            '43d92d3022cc2d57f35c9b6fde4997fa2dac8e0ff40afdc4078230b0aefb360f'
            '07719a0807d002370ea9f4331af7405e0bef55d221f3302c25e7a572b2ba7488')

prepare() {
  cd "$srcdir"/${pkgname}-Release_${pkgver}
  rm cmake-modules/FindSQLite3.cmake
  patch -p0 -i "$srcdir/0001-FindPortMidi.patch"
  patch -p1 -i "$srcdir/0001-Fix-SetHTMLBackgroundImage.patch"
}

build() {
  cd "$srcdir"

  rm -rf build
  mkdir build

  cd build
  WX_CONFIG=wx-config-gtk3 cmake -G "Unix Makefiles" \
		   -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-Release_${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
