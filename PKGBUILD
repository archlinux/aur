# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=allacrost-svn
pkgver=2040
pkgrel=1
pkgdesc='A single player 2D role-playing game inspired by classic console RPGs'
arch=('i686' 'x86_64')
url='http://www.allacrost.org/'
license=('GPL2')
depends=('glu' 'mesa' 'qt4' 'openal' 'libvorbis' 'sdl_ttf')
makedepends=('boost' 'subversion' 'icoutils')
conflicts=('allacrost')
options=('!emptydirs')
source=(allacrost::svn+https://allacrost.svn.sourceforge.net/svnroot/allacrost/trunk/game
png15.patch
allacrost.desktop)
md5sums=('SKIP'
         'a649b2c6e764bb99cb5a6fda7f87a39c'
         '0065e56f64dc81f3467f21f0f07bbc9c')

pkgver() {
  cd "$srcdir/allacrost"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "$srcdir/allacrost"
  svn patch ../png15.patch
}

build() {
  cd "$srcdir/allacrost"

  # Build
  autoreconf -i
  ./configure --prefix=/usr

  sed -i 's|bindir = ${prefix}/games|bindir = ${prefix}/bin|' Makefile
  sed -i 's|datarootdir = ${prefix}/share/games|datarootdir = ${prefix}/share|' Makefile
  make

  # Extract icon
  icotool -x img/logos/program_icon.ico
  mv program_icon_*.png allacrost.png
}

package() {
  install -D -m644 $srcdir/allacrost.desktop $pkgdir/usr/share/applications/allacrost.desktop
  cd "$srcdir/allacrost"
  make DESTDIR=$pkgdir install
  install -D -m644 allacrost.png $pkgdir/usr/share/icons/allacrost.png
}
