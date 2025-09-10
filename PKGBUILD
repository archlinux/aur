# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

###############################################################################
# INSTRUCTIONS                                                                #
# ------------                                                                #
#                                                                             #
# API changes between different Kodi versions make it necessary to specify    #
# the version of Kodi you want to build this package for. You can choose      #
# between Leia (18), Matrix (19), Nexus (20), Omega (21) and git master (99). #
# Do so in the following line.                                                #
#                                                                             #
###############################################################################

API=21

pkgname=kodi-addon-pvr-hts-git
pkgver=r1132.bc4a254
pkgrel=1
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.hts"
license=('GPL-2.0-only')
makedepends=('cmake' 'git' 'kodi-dev')
depends=('glibc' 'gcc-libs' 'kodi' 'kodi-platform')
provides=('kodi-addon-pvr-hts')
conflicts=('kodi-addon-pvr-hts' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git"
        https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb.patch)
sha256sums=('SKIP'
            '8a581a1e64e563053dfa0725e470c2dc85f0300dca0f1cd4223e0779304ff7f8')

case "$API" in
  18)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Leia" ;;
  19)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Matrix" ;;
  20)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Nexus" ;;
  21)  source[0]="${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=Omega" ;;
  99)  ;;
  *)   echo "Unknown API version. Follow instructions in PKGBUILD." && false
esac

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd "$pkgname"
 patch -p1 < "$srcdir"/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb.patch
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
