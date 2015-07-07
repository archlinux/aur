# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=domoticz-svn
pkgver=r2647
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
            '48834ff12ca6a0a45536428a8125bd74cc4b79dc59fe99649782e4d915642dce')

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
