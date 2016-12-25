pkgname=osvr-rendermanager-git
pkgver=v00_06_52.r83.g83872f2
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

  # this copies over osvr-core files from the system into the install directory so they would simply be overwritten in /usr/lib
  sed -i "/osvrrm_copy_deps(osvr::osvrClientKit osvr::osvrClient osvr::osvrCommon osvr::osvrUtil)/d" CMakeLists.txt

  echo
  echo "Patch Rendermanager to use an OpenGL Core Profile?"
  echo "For mesa drivers you should say Y, for proprietary drivers you should say n."
  echo "(Some of the example programs will not work with a Core Profile, this is not a rendermanagager bug, but a result of this patch)"
  echo "For more information refer to"
  echo "https://github.com/sensics/OSVR-RenderManager/issues/68"
  echo "https://github.com/sensics/OSVR-RenderManager/issues/233"
  read -p "[Y/n]? " -n 1 -r
  echo    # (optional) move to a new line
  case "$REPLY" in 
  y*|Y*|"" )
    echo "Patching rendermanager to use a core profile..."
    git apply -vvv "$srcdir"/../use_core_profile_unconditionally.diff
    echo "Patched..."
    ;;
  * )
    echo "Building unpatched..."
    ;;
  esac
  sleep 1
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
