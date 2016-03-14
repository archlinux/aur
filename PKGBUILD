pkgname=osvr-leap-motion-git
pkgver=r39.a078bea
pkgrel=1
pkgdesc="A plugin for OSVR that provides access to Leap Motion trackers from OSVR applications."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Leap-Motion"
makedepends=('git' 'cmake' 'osvr-core-git' 'leap-motion-sdk')
source=("osvr-leap-motion::git+https://github.com/feilen/OSVR-Leap-Motion.git")

pkgver() {
  cd "$srcdir/osvr-leap-motion"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-leap-motion

  mkdir -p "$srcdir/osvr-leap-motion-build"
}

build() {
  cd osvr-leap-motion-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../osvr-leap-motion
  make
}

package() {
  cd osvr-leap-motion-build
  make DESTDIR="$pkgdir/" install
  
  install -d "$pkgdir/usr/share/osvrcore/sample-configs/"
  install "$srcdir/osvr-leap-motion/com_osvr_LeapMotion.json" "$pkgdir/usr/share/osvrcore/sample-configs/"

  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
