pkgname=osvr-core-git
pkgver=last.dev.email.r433.g9ba5951
pkgrel=1
pkgdesc="The core libraries, applications, and plugins of the OSVR software platform."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Core"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('jsoncpp' 'markdown' 'boost' 'opencv' 'osvr-libfunctionality-git') #TODO: add more deps
source=("osvr-core::git+https://github.com/OSVR/OSVR-Core.git"
"json-schemas::git+https://github.com/OSVR/OSVR-JSON-Schemas.git"
"vendor-discount-windows-bins::git+https://github.com/OSVR/discount.git"
"vendor-jenkins-ctest-plugin::git+https://github.com/rpavlik/jenkins-ctest-plugin.git"
"vendor-vrpn::git+https://github.com/vrpn/vrpn.git"
"FindJsonCpp.cmake"
) #TODO: add more recursive submodules


pkgver() {
  cd "$srcdir/osvr-core"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-core
  find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  git submodule init
  git config submodule.json-schemas.url "$srcdir/json-schemas"
  git config submodule.vendor/discount-windows-bins.url "$srcdir/vendor-discount-windows-bins"
  git config submodule.vendor/jenkins-ctest-plugin.url "$srcdir/vendor-jenkins-ctest-plugin"
  git config submodule.vendor/vrpn.url "$srcdir/vendor-vrpn"
  git submodule update --init --recursive

  mkdir -p "$srcdir/osvr-core-build/cmake"
   cp "$srcdir/FindJsonCpp.cmake" "$srcdir/osvr-core/cmake/Findjsoncpp.cmake"
   sed -i '1 i\list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")' "$srcdir/osvr-core/CMakeLists.txt" #TODO CMAKE_MODULE_PATH

#temporary fix for boost incompatibility
sed -i "s/105900/106000/g" src/osvr/Common/IPCRingBuffer.cpp
sed -i "s/105900/106000/g" cmake-local/BoostTargets.cmake
}

build() {
  cd "$srcdir/osvr-core"
  git submodule init
  git submodule update
  cd "$srcdir/osvr-core-build"
  # tests don't link, undefined reference to json lib
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOSVR_UTIL_DEV_VERBOSE=1 -DBUILD_TESTING=0 -DBUILD_HEADER_DEPENDENCY_TESTS=0 ../osvr-core
# -DCMAKE_MODULE_PATH="$srcdir" ../osvr-core
# -Djsoncpp_DIR="$srcdir/osvr-core-build/jsoncppmake" ../osvr-core
  make
}

package() {
  cd "$srcdir/osvr-core-build"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
  rm -f "$pkgdir/usr/lib/libfunctionality.so.0.1" #????

   install -d "$pkgdir/usr/share/osvr"
}


# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '2dd82e55b6291d32c611dd899d8a8164')
