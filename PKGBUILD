# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-addon-pvr-vdr-vnsi
pkgver=1.11.15
_gitver=7e11b853637ec436e30e4ac826de6ee87c303482
pkgrel=1
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
depends=('kodi')
makedepends=('cmake' 'git' 'kodi-platform' 'libplatform')
source=("git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
  grep '  version' addon.xml | cut -d'"' -f2
}

prepare() {
  mkdir -p build
  cd "${srcdir}/pvr.vdr.vnsi"
  
  sed -i 's/{platform/{p8-platform/g' CMakeLists.txt
  sed -i 's/(platform/(p8-platform/g' CMakeLists.txt
  sed -i 's/"platform/"p8-platform/g' src/{*.cpp,*.h}
  sed -i 's/PLATFORM/P8PLATFORM/g' src/{*.cpp,*.h}

  mv pvr.vdr.vnsi/addon.xml.in pvr.vdr.vnsi/addon.xml
  sed -i 's/@PLATFORM@/linux/g' pvr.vdr.vnsi/addon.xml
  sed -i 's/@LIBRARY_FILENAME@/pvr.vdr.vnsi.so/g' pvr.vdr.vnsi/addon.xml
}

build() {
  cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -DCMAKE_BUILD_TYPE=Release \
        ../pvr.vdr.vnsi

  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cp -r "$srcdir"/pvr.vdr.vnsi/pvr.vdr.vnsi/* "$pkgdir/usr/lib/kodi/addons/pvr.vdr.vnsi"
}
