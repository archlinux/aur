pkgname=osvr-core-git
pkgver=0.2.r2243.g9456a41
pkgrel=1
pkgdesc="The core libraries, applications, and plugins of the OSVR software platform."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Core"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('jsoncpp' 'markdown' 'boost' 'opencv' 'osvr-libfunctionality-git' 'libuvc-git') #TODO: add more deps
source=("osvr-core::git+https://github.com/OSVR/OSVR-Core.git"
	"json-schemas::git+https://github.com/OSVR/OSVR-JSON-Schemas.git"
	"vendor-discount-windows-bins::git+https://github.com/OSVR/discount.git"
	"vendor-jenkins-ctest-plugin::git+https://github.com/rpavlik/jenkins-ctest-plugin.git"
	"vendor-vrpn::git+https://github.com/vrpn/vrpn.git"
	"FindJsonCpp.cmake"
) #TODO: add more recursive submodules


pkgver() {
  cd "$srcdir/osvr-core"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd osvr-core
  #find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  git submodule init
  git config submodule.json-schemas.url "$srcdir/json-schemas"
  git config submodule.vendor/discount-windows-bins.url "$srcdir/vendor-discount-windows-bins"
  git config submodule.vendor/jenkins-ctest-plugin.url "$srcdir/vendor-jenkins-ctest-plugin"
  git config submodule.vendor/vrpn.url "$srcdir/vendor-vrpn"
  git submodule update --init --recursive

  mkdir -p "$srcdir/osvr-core-build/"

#temporary fix for boost incompatibility
#sed -i "s/105900/106200/g" src/osvr/Common/IPCRingBuffer.cpp #doesn't work with 1.62
#sed -i "s/105900/106200/g" cmake-local/BoostTargets.cmake

#https://github.com/OSVR/OSVR-Core/pull/468
cd vendor/vrpn
git reset --hard origin/master
cd ..
git commit -am "update vrpn"

#WIP positional tracking
git remote add toastedcrumpets https://github.com/toastedcrumpets/OSVR-Core.git || true
git fetch toastedcrumpets uvc-camera
git merge toastedcrumpets/uvc-camera --no-edit
}

build() {
  cd "$srcdir/osvr-core"
  git submodule init
  git submodule update
  cd "$srcdir/osvr-core-build"
  # tests don't link, undefined reference to json lib
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOSVR_UTIL_DEV_VERBOSE=1 -DBUILD_TESTING=0 -DBUILD_HEADER_DEPENDENCY_TESTS=0 -DCMAKE_INSTALL_LIBDIR=lib ../osvr-core
# -DCMAKE_MODULE_PATH="$srcdir" ../osvr-core
# -Djsoncpp_DIR="$srcdir/osvr-core-build/jsoncppmake" ../osvr-core
  make
}

package() {
  cd "$srcdir/osvr-core-build"
  make DESTDIR="$pkgdir/" install
  #mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
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
