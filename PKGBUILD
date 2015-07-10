# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz-svn
pkgver=r2656
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave-snapshot' 'libusb-compat' 'curl' 'sqlite' 'boost-libs')
makedepends=('subversion' 'cmake' 'boost')
source=('domoticz::svn://svn.code.sf.net/p/domoticz/code/trunk'
        'domoticz.service')
sha256sums=('SKIP'
            'e7a310198e3830ef1a735ee2c864c749b186080db77bee28b2d63a0a8abef877')

pkgver() {
  cd "domoticz"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/domoticz"

  # Dynamicly link to libopenzwave instead of static link
  sed -i 's/find_library(OpenZWave NAMES libopenzwave.a HINTS "..\/open-zwave-read-only" "..\/open-zwave-read-only\/cpp\/build")/find_library(OpenZWave NAMES libopenzwave.so)/' CMakeLists.txt

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
}

package() {
  cd "${srcdir}/domoticz/build"

  # remove install instruction for missing .h file
  sed -ie '104d' cmake_install.cmake

  make DESTDIR=${pkgdir} install 
  cp svnversion.h "${pkgdir}/opt/domoticz/"
  chmod o+r "${pkgdir}/opt/domoticz/updatedomo"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ../../domoticz.service "${pkgdir}/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 et:
