# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

###############################################################################
# INSTRUCTIONS                                                                #
# ------------                                                                #
#                                                                             #
# API changes between different Kodi versions make it necessary to specify    #
# the version of Kodi you want to build this package for. You can choose      #
# between Krypton (17), Leia (18) and git master (99). Do so in the following #
# line.                                                                       #
#                                                                             #
###############################################################################

API=18

pkgname=kodi-addon-pvr-vdr-vnsi-git
pkgver=r613.9e4d93a
pkgrel=1
pkgdesc='VDR VNSI PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform-git' 'kodi-dev')
depends=('kodi')
provides=('kodi-addon-pvr-vdr-vnsi')
conflicts=('kodi-addon-pvr-vdr-vnsi' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git")
md5sums=('SKIP')

case "$API" in
  17)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=Krypton" ;;
  18)  ;; #source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=Leia" ;;
  99)  ;;
  *)   echo "Unknown API version. Follow instructions in PKGBUILD." && false
esac

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$pkgname/build"
  cd "$pkgname/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=/usr/lib/kodi \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
