pkgname=osvr-oculus-rift-git
pkgver=v0.1.r22.ga9bedc6
pkgrel=3
pkgdesc="A plugin for OSVR that provides access to Oculus Rift trackers from OSVR applications."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Oculus-Rift"
#license=('GPL')
makedepends=('git' 'cmake' 'vrpn-oculus-git')
#depends=('osvr-core-git') #TODO: add more deps
source=("osvr-oculus-rift::git+https://github.com/OSVR/OSVR-Oculus-Rift.git"
    "Findjsoncpp.cmake")

pkgver() {
  cd "$srcdir/osvr-oculus-rift"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-oculus-rift
  find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  mkdir -p "$srcdir/osvr-oculus-rift-build"
  cp "$srcdir/Findjsoncpp.cmake" "$srcdir/osvr-oculus-rift/cmake"
}

build() {
  cd osvr-oculus-rift-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOVR_ROOT_DIR=/usr/include/ovr-$(pkg-config --modversion libovr)/ ../osvr-oculus-rift
# -DCMAKE_CXX_FLAGS="-DVRPN_USE_OVR=1" 
  make
}

package() {
  cd osvr-oculus-rift-build
  make DESTDIR="$pkgdir/" install
  
  install -d "$pkgdir/usr/share/osvr/sample-configs/"
  #mv "$pkgdir/usr/bin/"*"/" "$pkgdir/usr/share/osvr"
  install "$srcdir/osvr-oculus-rift/com_osvr_OculusRift.json" "$pkgdir/usr/share/osvr/sample-configs/"
  mv "$pkgdir/usr/osvr_server_config.oculusrift.sample.json" "$pkgdir/usr/share/osvr/sample-configs/"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
  sed -i "s;displays/Oculus_Rift_DK2.json;/usr/share/osvr/displays/Oculus_Rift_DK2.json;g" "$pkgdir"/usr/share/osvr/sample-configs/osvr_server_config.oculusrift.sample.json
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         '2dd82e55b6291d32c611dd899d8a8164')
