# Contributor: Todd Musall 
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Maintainer: Lari Tikkanen

pkgname=('heimdall-git')
_gitname="heimdall"
pkgver=1.4.1.r21.gd0526a3
pkgrel=1
pkgdesc="A cross-platform open-source utility to flash firmware (aka ROMs) onto Samsung Galaxy S devices."
arch=('i686' 'x86_64')
url="http://www.glassechidna.com.au/products/heimdall/"
license=('MIT')
depends=('libusb' 'qt5-base')      
makedepends=('cmake' 'git')
optdepends=('android-udev: Udev rules to connect Android devices to you linux box')
conflicts=('heimdall')
provides=('heimdall')
source=("$_gitname::git://github.com/Benjamin-Dobell/Heimdall.git"
        "heimdall.desktop"
        "BridgeManager.patch")
md5sums=('SKIP'
         '6c4de9e74c0d9e7ab4d50af21303b78a'
         '8fce869eb9539b6b410b1a52370c3824')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/heimdall/
  patch -Np1 -i ${srcdir}/BridgeManager.patch
}

build() {
  cd ${srcdir}/heimdall/

  if [ -d build ] ; then
    rm -rf build
  fi

  mkdir build
  cd build
  
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/$_gitname

  install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"

  cd build

  install -m755 -D bin/heimdall "${pkgdir}/usr/bin/heimdall"

  install -m755 bin/heimdall-frontend "${pkgdir}/usr/bin/heimdall-frontend"
  install -m644 -D "${srcdir}/heimdall.desktop" "${pkgdir}/usr/share/applications/heimdall.desktop"
}
