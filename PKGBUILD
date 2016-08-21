# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=5.4.2
pkgrel=8
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'wxgtk' 'sqlite3' 'boost-libs')
optdepends=('timidity++: for sound without external midi player')
makedepends=('boost' 'unittestpp' 'cmake>=2.8')

source=("https://codeload.github.com/lenmus/lenmus/tar.gz/Release_${pkgver}"
	0001-Fixes-in-Lomse-for-compiling-with-C-11.patch
	0001-More-fixes-for-C-11.patch)
md5sums=('0b1adb4e187f6dc08b0dc03029c68f4d'
         '4ee9268720acaa2ced3a7a782701e71d'
         '760082915af45d0999eee8d7a73284fe')

prepare() {
  cd "$srcdir/${pkgname}-Release_${pkgver}/"

  patch -p1 -i "$srcdir/0001-Fixes-in-Lomse-for-compiling-with-C-11.patch"
  patch -p1 -i "$srcdir/0001-More-fixes-for-C-11.patch"
}

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-Release_${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
