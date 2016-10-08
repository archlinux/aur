pkgname=osvr-openhmd-git
pkgver=v1.0.2.r1.g129032a
pkgrel=1
pkgdesc="OSVR plugin providing Oculus Rift DK1 & DK2 orientation tracking via OpenHMD."
arch=(i686 x86_64)
url="https://github.com/simlrh/OSVR-OpenHMD"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'openhmd-git')
source=("osvr-openhmd::git+https://github.com/simlrh/OSVR-OpenHMD.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/osvr-openhmd"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-openhmd
  # find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  mkdir -p "$srcdir/osvr-openhmd-build"
  # cp "$srcdir/Findjsoncpp.cmake" "$srcdir/osvr-vive/cmake"

  git submodule init
  git submodule update
}

build() {
  cd osvr-openhmd-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release ../osvr-openhmd
  make
}

package() {
  cd osvr-openhmd-build
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir"/usr/share/osvrcore/sample-configs
  mkdir -p "$pkgdir"/usr/share/osvrcore/displays

  cp -ra "$srcdir"/osvr-openhmd/sample-configs/* "$pkgdir"/usr/share/osvrcore/sample-configs/
  cp "$srcdir"/osvr-openhmd/sample-configs/renderManager.extended.landscape.json "$pkgdir"/usr/share/osvrcore/sample-configs/openhmd-dk1-renderManager.extended.landscape.json
  cp "$srcdir"/osvr-openhmd/sample-configs/osvr_server_config.json "$pkgdir"/usr/share/osvrcore/sample-configs/osvr_server_config.openhmd_dk1.json
  cp "$srcdir"/osvr-openhmd/sample-configs/Oculus_Rift_DK1.json "$pkgdir"/usr/share/osvrcore/displays/Oculus_Rift_DK1_openhmd.json

  #This is the osvr supplied display file. It has slightly different coefficients. So if that doesn't work, try the one from openhmd
  sed -i 's|"Oculus_Rift_DK1.json"|"/usr/share/osvrcore/displays/Oculus_Rift_DK1.json"|g' "$pkgdir"/usr/share/osvrcore/sample-configs/osvr_server_config.openhmd_dk1.json
  #sed -i 's|"Oculus_Rift_DK1.json"|"/usr/share/osvrcore/displays/Oculus_Rift_DK1_openhmd.json"|g' "$pkgdir"/usr/share/osvrcore/sample-configs/osvr_server_config.openhmd_dk1.json


  sed -i 's|"renderManager.extended.landscape.json"|"/usr/share/osvrcore/sample-configs/osvr_server_config.openhmd_dk1.json"|g' "$pkgdir"/usr/share/osvrcore/sample-configs/osvr_server_config.openhmd_dk1.json

  # This file already has a version in osvr-core.
  # The file deleted here has "maxMsBeforeVSync": 5 while the one in osvr-core sets it to 0.
  # So if something is wrong, try setting it to 5
  rm "$pkgdir"/usr/share/osvrcore/sample-configs/renderManager.extended.landscape.json
}


# vim:set ts=2 sw=2 et:
