# Maintainer: IanDury

pkgname=domoticz-git
_gitname="domoticz"
pkgver=r5051
pkgrel=1
pkgdesc="Web based home automation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave-git' 'libusb-compat' 'curl' 'sqlite' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
conflicts=('domoticz-svn')
install='domoticz-git.install'
source=('git+https://github.com/domoticz/domoticz.git'
         'domoticz.service')
sha256sums=('SKIP'
             '8627b3a82db83a0d94c830c007c09ffd38366505fced9c724a7c29414837f3ad')

pkgver() {
  cd $_gitname
  printf "r%s" "$(git rev-list --count HEAD| awk '{print $1 + 2107}')"
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DUSE_STATIC_OPENZWAVE=NO CMakeLists.txt
}

package() {
  cd $_gitname

  make DESTDIR=${pkgdir} install 
  chmod o+r "${pkgdir}/opt/domoticz/updatedomo"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ../../domoticz.service "${pkgdir}/usr/lib/systemd/system/"
  chown -R http:http "${pkgdir}/opt/domoticz"
}
