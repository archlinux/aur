# Maintainer: Julian Xhokaxhiu < info at julianxhokaxhiu dot com >

pkgname=kodi-addon-pvr-hts-rbp-git
pkgver=r444.43288db
pkgrel=1
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/kodi-pvr/pvr.hts"
license=('GPL')
makedepends=('cmake' 'git' 'libplatform')
depends=('kodi')
provides=('kodi-addon-pvr-hts')
conflicts=('kodi-addon-pvr-hts' 'kodi-pvr-addons')
source=("git+https://github.com/kodi-pvr/pvr.hts.git"
        "git+https://github.com/xbmc/kodi-platform.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/pvr.hts"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-addon build-platform

  cd "${srcdir}/pvr.hts"

  mv pvr.hts/addon.xml.in pvr.hts/addon.xml
  sed -i 's/@PLATFORM@/linux/g' pvr.hts/addon.xml
  sed -i 's/@LIBRARY_FILENAME@/pvr.hts.so/g' pvr.hts/addon.xml
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
        ../pvr.hts

  make
}

package() {
  cd build-addon
  make DESTDIR="${pkgdir}" install

  cp -r "$srcdir"/pvr.hts/pvr.hts/* "$pkgdir/usr/lib/kodi/addons/pvr.hts"
}
