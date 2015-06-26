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
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2" "drumstick.tar.gz")
md5sums=('581d29ff9a0aabf4aeb6beeb40f589b0' 'e55595ace976c90d45b55ea4f3a3da38')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  tar -xf ../drumstick.tar.gz
    
  #sed -i '/KDE4Defaults/ a INCLUDE(${QT_USE_FILE})\n MESSAGE("QT_USE_FILE: ${QT_USE_FILE}")' CMakeLists.txt

  # doc build errors prevent success
  sed -i '/doc/d' CMakeLists.txt
  
  # Compile code with -fPIC (build code with Position Independent Code)
  #sed -i '/-DQT_STRICT_ITERATORS/ a ADD_DEFINITIONS(-fPIC)' CMakeLists.txt
  sed -i '/CMAKE_MINIMUM_REQUIRED/ a SET(CMAKE_CXX_FLAGS "-fPIC")' CMakeLists.txt
  
  #sed -i 's/OPTION(ENABLE_PCH       "Enable precompiled headers" OFF)/OPTION(ENABLE_PCH       "Enable precompiled headers" ON)/' CMakeLists.txt
  sed -i 's/OPTION(STATIC_DRUMSTICK "Build drumstick static library" OFF)/OPTION(STATIC_DRUMSTICK "Build drumstick static library" ON)/' CMakeLists.txt
  
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
          
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: