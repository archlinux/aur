# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

###############################################################################
# INSTRUCTIONS                                                                #
# ------------                                                                #
#                                                                             #
# API changes between different Kodi versions make it necessary to specify    #
# the version of Kodi you want to build this package for. You can choose      #
# between Isengard (15), Jarvis (16) and git master (99). Do so in the        #
# following line.                                                             #
###############################################################################

API=16

pkgname=kodi-platform-git
pkgver=r38.15edaf7
pkgrel=1
pkgdesc='Kodi platform support library'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/xbmc/kodi-platform"
license=('GPL')
makedepends=('cmake' 'git')
depends=('kodi')
provides=('kodi-platform')
conflicts=('kodi-platform')
source=("${pkgname}::git+https://github.com/xbmc/kodi-platform.git")
md5sums=('SKIP')

# Corresponding commit IDs are taken from
# https://github.com/xbmc/xbmc/blob/$BRANCH/project/cmake/addons/depends/common/kodi-platform/kodi-platform.txt
case "$API" in
  15)  depends+=('libplatform-legacy')
       source[0]="${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=054a42f66" ;;
  16)  depends+=('libplatform-legacy')
       source[0]="${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=15edaf78d" ;;
  17)  depends+=('p8-platform')
       source[0]="${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=c8188d826" ;;
  99)  depends+=('p8-platform') ;;
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
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
