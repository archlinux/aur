# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

###############################################################################
# INSTRUCTIONS                                                                #
# ------------                                                                #
#                                                                             #
# API changes between different Kodi versions make it necessary to specify    #
# the version of Kodi you want to build this package for. You can choose      #
# between Isengard (15), Jarvis (16), Krypton (17) and git master (99). Do so #
# in the following line.                                                      #
#                                                                             #
###############################################################################

API=17

pkgname=kodi-addon-pvr-hts-git
pkgver=r612.82ea43f
pkgrel=1
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.hts"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform-git')
depends=('kodi')
provides=('kodi-addon-pvr-hts')
conflicts=('kodi-addon-pvr-hts' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git")
md5sums=('SKIP')

case "$API" in
  15)  depends+=('libplatform-legacy')
       source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Isengard" ;;
  16)  depends+=('libplatform-legacy')
       source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Jarvis" ;;
  17)  depends+=('p8-platform')
       makedepends+=('kodi-dev')
       source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Krypton" ;;
  99)  depends+=('p8-platform')
       makedepends+=('kodi-dev') ;;
  *)   error "Unknown API version. Follow instructions in PKGBUILD." && false
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
