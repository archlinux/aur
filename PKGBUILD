# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=6.0.1
pkgrel=4
pkgdesc="A free program for learning music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/"
license=('GPL')
depends=('portmidi' 'wxwidgets-gtk3' 'sqlite3' 'fluidsynth' 'soundfont-fluid')
optdepends=('timidity++: for sound without external midi player')
makedepends=('unittestpp' 'cmake')

source=("https://github.com/lenmus/lenmus/archive/Release_${pkgver}.tar.gz"
		"0002-PortTime-included.patch"
		"0003-fix-freetype-breaking-change.patch"
		"0004-bump-cmake-to-3.5.patch")
sha256sums=('1fa5b8edc468c800598845aa809b4a4e93058ed13af40bfacd037c44d1c4bc1d'
            '7e23b83488bce81489f063dd59a625ed3fdd5be545e10cecd256794be80a2fcf'
            '777b055785058063b5348f516a81e0899c880aff67c136595b597208b138e9f5'
            '4922136b87b8d22ea32ca111024c6f0034aa5e2cb10f74a9ace2aedbc4e03e46')

prepare() {
  cd "${pkgname}-Release_${pkgver}"

  rm cmake-modules/FindSQLite3.cmake
  patch -p0 -i "$srcdir/0002-PortTime-included.patch"
  patch -p1 -i "$srcdir/0003-fix-freetype-breaking-change.patch"
  patch -p1 -i "$srcdir/0004-bump-cmake-to-3.5.patch"
}

build() {

  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" \
		   -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-Release_${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd build

  make DESTDIR="${pkgdir}/" install
}
