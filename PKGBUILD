# Maintainer: Gerhard Stein <gerstrong@steinzone.de>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
pkgname=commander-genius-git
_pkgname=Commander-Genius
pkgver=v2.3.8.r3.g2d22da699
pkgrel=1
pkgdesc="A modern implementation of the classic Commander Keen game series"
arch=('i686' 'x86_64')
url="http://clonekeenplus.sourceforge.net"
license=('GPL')
groups=()
depends=('sdl2' 'mesa' 'libvorbis' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer'  'boost' 'boost-libs' 'python')
makedepends=('git' 'cmake' 'glu')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git+https://gitlab.com/Dringgstein/Commander-Genius.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
}


build() {
  mkdir -p "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname"
  sed -i 's/APPDIR\ games/APPDIR\ bin/' ./src/install.cmake
  cd "$srcdir/$_pkgname-build"
  
  [ $CARCH == 'x86_64' ] && cmake -S "$srcdir/$_pkgname" -B "$srcdir/$_pkgname-build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
  [ $CARCH == 'i686' ] && cmake -S "$srcdir/$_pkgname" -B "$srcdir/$_pkgname-build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make DESTDIR="$pkgdir/" install
}
