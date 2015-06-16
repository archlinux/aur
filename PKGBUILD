pkgname=osvr-tracker-viewer-git
pkgver=r26.2115743
pkgrel=1
pkgdesc="Utility for viewing tracker (pose, position, orientation) data from the OSVR framework."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Tracker-Viewer"
#license=('GPL')
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'openscenegraph')
source=("osvr-tracker-viewer::git+https://github.com/OSVR/OSVR-Tracker-Viewer.git"
    "https://raw.githubusercontent.com/rpavlik/cmake-modules/master/FindMarkdown.cmake"
    "https://raw.githubusercontent.com/rpavlik/cmake-modules/master/UseMarkdown.cmake")

pkgver() {
  cd "$srcdir/osvr-tracker-viewer"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-tracker-viewer
  find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  mkdir -p "$srcdir/osvr-tracker-viewer-build"
  cp "$srcdir/"*.cmake "$srcdir/osvr-tracker-viewer/"
}

build() {
  cd osvr-tracker-viewer-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../osvr-tracker-viewer
  make
}

package() {
  cd osvr-tracker-viewer-build
  install -d "$pkgdir/usr/bin"
  install -m755 "OSVRTrackerView" "$pkgdir/usr/bin"
  #make DESTDIR="$pkgdir/" install
  #TODO
  #rm "$pkgdir/usr/LICENSE"
  #rm "$pkgdir/usr/NOTICE"
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         '891ee26fa081a1305df71c8e2f00e456'
         'f0c88e585789807e8aa1c50b4a8c14b5')
