pkgname=osvr-core-git
pkgver=0.2.r3011.g9e56bfa3
pkgrel=1
pkgdesc="The core libraries, applications, and plugins of the OSVR software platform."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Core"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('jsoncpp' 'markdown' 'boost' 'opencv' 'osvr-libfunctionality-git' 'libuvc') #TODO: add more deps
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

git pull origin pull/493/head --no-edit # positional tracking unifiedvideoinertialtracker

#git cherry-pick 3b5e3a6f3132afbdaf251161ba3b3d03c790f45f #disable ignored-attributes warning on gcc
}

build() {
  cd "$srcdir/osvr-core"
  git submodule init
  git submodule update
  cd "$srcdir/osvr-core-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOSVR_UTIL_DEV_VERBOSE=0 -DBUILD_TESTING=0 -DBUILD_HEADER_DEPENDENCY_TESTS=0 -DCMAKE_INSTALL_LIBDIR=lib ../osvr-core
  make
}

package() {
  cd "$srcdir/osvr-core-build"
  make DESTDIR="$pkgdir/" install
  #mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
  rm -f "$pkgdir/usr/lib/libfunctionality.so.0.1" #????

   install -d "$pkgdir/usr/share/osvr"
}


md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '2dd82e55b6291d32c611dd899d8a8164')

# vim:set ts=2 sw=2 et:
