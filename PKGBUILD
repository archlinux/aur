pkgname=osvr-rendermanager-git
pkgver=v00_06_52.r350.g56f9db6
pkgrel=1
pkgdesc="TW, ATW and high performance rendering with OpenGL and GLES"
arch=(i686 x86_64)
url="https://github.com/sensics/OSVR-RenderManager"
#license=('GPL')
#install=osvr-rendermanager.install
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'eigen') #TODO: add more deps
source=("osvr-rendermanager::git+https://github.com/sensics/OSVR-RenderManager.git"
  "vendor-vrpn::git+https://github.com/vrpn/vrpn.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/osvr-rendermanager"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-rendermanager

  git submodule init vendor/vrpn #NDA
  git config submodule.vendor/vrpn.url "$srcdir/vendor-vrpn"
  git submodule update #--init #--recursive #NDA

  mkdir -p "$srcdir/osvr-rendermanager-build"

  # fix library naming of jsoncpp
  sed -i "s/jsoncpp_lib/jsoncpp/g" "$srcdir"/osvr-rendermanager/cmake/FindJsonCpp.cmake

  # this copies over osvr-core files from the system into the install directory so they would simply be overwritten in /usr/lib
  sed -i "/osvrrm_copy_deps(osvr::osvrClientKit osvr::osvrClient osvr::osvrCommon osvr::osvrUtil)/d" CMakeLists.txt
}

build() {
  cd osvr-rendermanager-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib ../osvr-rendermanager
  make
}

package() {
  cd osvr-rendermanager-build
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir"/usr/share/osvrcore/sample-configs/
  cp -ra "$srcdir"/osvr-rendermanager/installer/* "$pkgdir"/usr/share/osvrcore/sample-configs/
}

# vim:set ts=2 sw=2 et:
