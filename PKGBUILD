# Maintainer: zoe <chp321@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kmidimon
pkgver=0.7.5
pkgrel=6
pkgdesc="A MIDI monitor for Linux using ALSA sequencer"
arch=('i686' 'x86_64')
url="http://kmidimon.sourceforge.net/"
license=('GPL')
depends=('kdelibs' 'drumstick')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('581d29ff9a0aabf4aeb6beeb40f589b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # doc build errors prevent success
  sed -i '/doc/d' CMakeLists.txt
  
  # Compile code with -fPIC (build code with Position Independent Code)
  sed -i '49iADD_DEFINITIONS(-fPIC)' CMakeLists.txt
  
  #sed -i 's/OPTION(STATIC_DRUMSTICK\ \"Build\ drumstick\ static\ library\"\ OFF)/OPTION(STATIC_DRUMSTICK\ \"Build\ drumstick\ static\ library\"\ ON)/' CMakeLists.txt
  sed -i 's/OPTION(STATIC_DRUMSTICK "Build drumstick static library" OFF)/OPTION(STATIC_DRUMSTICK "Build drumstick static library" ON)/' CMakeLists.txt
  
  #sed -i '/INCLUDE_DIRECTORIES/ a INCLUDE_DIRECTORIES("/usr/include/drumstick/")' CMakeLists.txt
  
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
          
  make STATIC_DRUMSTICK
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: