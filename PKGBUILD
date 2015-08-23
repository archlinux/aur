# Maintainer: IanDury

pkgname=domoticz-git
_gitname="domoticz"
pkgver=r659.c357e92
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave' 'libusb-compat' 'curl' 'sqlite' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
conflicts=('domoticz-svn')
source=('git://github.com/domoticz/domoticz.git'
         'domoticz.service')
sha256sums=('SKIP'
             '1aead77748b3987bd915370904d959b81be56fde68aee5bf356ed864dbb75516')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd $_gitname

  # Dynamicly link to libopenzwave instead of static link
  sed -i 's/find_library(OpenZWave NAMES libopenzwave.a HINTS "..\/open-zwave-read-only" "..\/open-zwave-read-only\/cpp\/build")/find_library(OpenZWave NAMES libopenzwave.so)/' CMakeLists.txt

  cmake -DCMAKE_BUILD_TYPE=Release CMakeLists.txt
}

package() {
  cd $_gitname

  make DESTDIR=${pkgdir} install 
  chmod o+r "${pkgdir}/opt/domoticz/updatedomo"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ../../domoticz.service "${pkgdir}/usr/lib/systemd/system/"
  chown -R http:http . "${pkgdir}/opt/domoticz"
}
