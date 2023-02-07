# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

###############################################################################
# INSTRUCTIONS                                                                #
# ------------                                                                #
#                                                                             #
# API changes between different Kodi versions make it necessary to specify    #
# the version of Kodi you want to build this package for. You can choose      #
# between Leia (18), Matrix (19), Nexus (20) and git master (99). Do so in    #
# the following line.                                                         #
#                                                                             #
###############################################################################

API=20

pkgname=kodi-addon-pvr-vdr-vnsi-git
pkgver=r758.df0ddbe
pkgrel=1
pkgdesc='VDR VNSI PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-dev')
depends=('kodi' 'kodi-platform')
provides=('kodi-addon-pvr-vdr-vnsi')
conflicts=('kodi-addon-pvr-vdr-vnsi' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git")
md5sums=('SKIP')

case "$API" in
  18)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=Leia" ;;
  19)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=Matrix" ;;
  20)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=Nexus" ;;
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
