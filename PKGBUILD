# Contributor: Todd Musall 
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Maintainer: Lari Tikkanen

pkgname=('heimdall-nogui-git')
_gitname="heimdall"
pkgver=1.4.2.r3.g9bcc42d
pkgrel=1
pkgdesc="A cross-platform open-source utility to flash firmware (aka ROMs) onto Samsung Galaxy S devices."
arch=('i686' 'x86_64')
url="https://glassechidna.com.au/heimdall/"
license=('MIT')
depends=('libusb')
makedepends=('cmake' 'git')
optdepends=('android-udev: Udev rules to connect Android devices to you linux box')
conflicts=('heimdall')
provides=('heimdall')
source=("$_gitname::git+https://gitlab.com/BenjaminDobell/Heimdall.git"
        "BridgeManager.patch")
md5sums=('SKIP'
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
  
  cmake -DCMAKE_BUILD_TYPE=Release -DDISABLE_FRONTEND=ON ..
  make
}

package() {
  cd ${srcdir}/$_gitname

  install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"

  cd build

  install -m755 -D bin/heimdall "${pkgdir}/usr/bin/heimdall"
}
