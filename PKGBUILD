# Maintainer: IanDury

pkgname=domoticz-git
_gitname="domoticz"
pkgver=r3220
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave-git' 'libusb-compat' 'curl' 'sqlite' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
conflicts=('domoticz-svn')
install=('domoticz-git.install')
source=('git://github.com/domoticz/domoticz.git'
         'domoticz.service')
sha256sums=('SKIP'
             '480960485b8573d96adcf3a257ae26b27418f752cf5300a0b4b9fc5135245d48')

pkgver() {
  cd $_gitname
  printf "r%s" "$(git rev-list --count HEAD| awk '{print $1 + 2107}')"
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
  chown -R http:http "${pkgdir}/opt/domoticz"
}
