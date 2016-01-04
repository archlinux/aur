# Maintainer: Julian Xhokaxhiu < info at julianxhokaxhiu dot com >
pkgname=kodi-addon-pvr-vdr-vnsi-rbp-git
pkgver=1.11.12
pkgrel=1
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
depends=('kodi')
makedepends=('cmake' 'git' 'libplatform')
source=("git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git"
        "git+https://github.com/xbmc/kodi-platform.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
  grep '  version' addon.xml.in | cut -d'"' -f2
}

prepare() {
  mkdir -p build-addon build-platform
  cd "${srcdir}/pvr.vdr.vnsi"

  mv pvr.vdr.vnsi/addon.xml.in pvr.vdr.vnsi/addon.xml
  sed -i 's/@PLATFORM@/linux/g' pvr.vdr.vnsi/addon.xml
  sed -i 's/@LIBRARY_FILENAME@/pvr.vdr.vnsi.so/g' pvr.vdr.vnsi/addon.xml
}

build() {
  cd build-platform
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
        -DCMAKE_INSTALL_LIBDIR_NOARCH="/usr/lib" \
        -DCMAKE_BUILD_TYPE=Release \
        ../kodi-platform

  cd ../build-addon

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -Dkodiplatform_DIR="$srcdir/build-platform" \
        -DCMAKE_BUILD_TYPE=Release \
        ../pvr.vdr.vnsi

  make
}

package() {
  cd build-addon
  make DESTDIR="${pkgdir}" install

  cp -r "$srcdir"/pvr.vdr.vnsi/pvr.vdr.vnsi/* "$pkgdir/usr/lib/kodi/addons/pvr.vdr.vnsi"
}
