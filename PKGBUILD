# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-addon-pvr-vdr-vnsi
pkgver=1.11.4
_gitver=73de793af0eca67170b5a790db42d435c3a07b4d
pkgrel=2
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
depends=('kodi')
makedepends=('cmake' 'git' 'libplatform')
source=("git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#commit=$_gitver"
        "git+https://github.com/xbmc/kodi-platform.git"
        "96daf6c2d483b760d5a8a0d80aa6759af1bfdc70.diff")
md5sums=('SKIP'
         'SKIP'
         '9091c2a74932df833277bb776e6f55d7')

pkgver() {
  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
  grep '  version' addon.xml.in | cut -d'"' -f2
}

prepare() {
  mkdir -p build-addon build-platform
  cd "${srcdir}/pvr.vdr.vnsi"

  patch -p1 -R -i "$srcdir/96daf6c2d483b760d5a8a0d80aa6759af1bfdc70.diff"

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
