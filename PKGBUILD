# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-addon-pvr-vdr-vnsi
pkgver=1.11.19
# Note: Use commits from "Jarvis" branch for Kodi 16
_gitver=5d54ac0c420e97d48fe9d77f07ccb42d347be980
pkgrel=1
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
depends=('kodi')
makedepends=('cmake' 'git' 'kodi-platform')
source=("git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
  grep '  version' addon.xml.in | cut -d'"' -f2
}

prepare() {
  cd "${srcdir}/pvr.vdr.vnsi"

  # "libplatform" got renamed to "p8-platform" with version 2.0
  sed -i 's/{platform/{p8-platform/g' CMakeLists.txt
  sed -i 's/(platform/(p8-platform/g' CMakeLists.txt
  sed -i 's/"platform/"p8-platform/g' src/{*.cpp,*.h}
  sed -i 's/PLATFORM/P8PLATFORM/g' src/{*.cpp,*.h}
}

build() {
  mkdir -p "${srcdir}/pvr.vdr.vnsi/build"
  cd "${srcdir}/pvr.vdr.vnsi/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -DCMAKE_BUILD_TYPE=Release \
        ..

  make
}

package() {
  cd "${srcdir}/pvr.vdr.vnsi/build"
  make DESTDIR="${pkgdir}" install

  cp -r "$srcdir"/pvr.vdr.vnsi/pvr.vdr.vnsi/* "$pkgdir/usr/lib/kodi/addons/pvr.vdr.vnsi"
}
