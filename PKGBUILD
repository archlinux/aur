pkgname=osvr-display-git
pkgver=r51.36d8aca
pkgrel=1
pkgdesc="Cross-platform detection and configuration of displays"
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Display"
#license=('GPL')
makedepends=('git' 'cmake')
source=("git+https://github.com/OSVR/OSVR-Display.git")

md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/OSVR-Display"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/OSVR-Display"
  git submodule init
  git submodule update --recursive
}

build() {
  mkdir -p "$srcdir/OSVR-Display-build"
  cd "$srcdir/OSVR-Display-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../OSVR-Display
  make
}

package() {
  cd "$srcdir/OSVR-Display-build"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/lib/libdocopt* "$pkgdir"/usr/lib/cmake/docopt/ "$pkgdir"/usr/include/docopt/
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true

  install -d "$pkgdir/usr/include"
  cp -ra "$srcdir/OSVR-Display/osvr" "$pkgdir"/usr/include
  ln -s Display "$pkgdir"/usr/include/osvr/display
}

# vim:set ts=2 sw=2 et:
