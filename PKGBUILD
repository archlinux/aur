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

pkgname=kodi-platform-git
pkgver=r57.e8574b8
pkgrel=1
pkgdesc='Kodi platform support library'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/xbmc/kodi-platform"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-dev')
depends=('kodi' 'p8-platform')
provides=('kodi-platform')
conflicts=('kodi-platform')
source=("${pkgname}::git+https://github.com/xbmc/kodi-platform.git")
md5sums=('SKIP')

# Corresponding commit IDs are taken from
# https://github.com/xbmc/xbmc/blob/$BRANCH/[project/]cmake/addons/depends/common/kodi-platform/kodi-platform.txt
case "$API" in
  17)  source[0]="${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=c8188d826" ;;
  18)  source[0]="${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=e8574b883" ;;
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
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/kodi \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
