pkgname=osvr-vive-git
pkgver=r165.873f07c
pkgrel=1
pkgdesc="OSVR driver for use with the HTC Vive (including Vive PRE)"
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Vive"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'openvr-git') #TODO: add more deps
source=("osvr-vive::git+file:///home/bmonkey/workspace/vr/OSVR/OSVR-Vive-Libre")
md5sums=('SKIP')
options=(debug !strip)

pkgver() {
  cd "$srcdir/osvr-vive"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-vive
  # find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  mkdir -p "$srcdir/osvr-vive-build"
  # cp "$srcdir/Findjsoncpp.cmake" "$srcdir/osvr-vive/cmake"
}

build() {
  cd osvr-vive-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Debug ../osvr-vive
  make
}

package() {
  cd osvr-vive-build
  make DESTDIR="$pkgdir/" install

  mv $pkgdir/usr/lib64 $pkgdir/usr/lib

  rm $pkgdir/usr/README.md
  rm $pkgdir/usr/LICENSE

  mkdir -p $pkgdir/usr/share/osvrcore/sample-configs
  mv $pkgdir/usr/osvr_server_config.vive_libre.sample.json $pkgdir/usr/share/osvrcore/sample-configs
}


# vim:set ts=2 sw=2 et:
