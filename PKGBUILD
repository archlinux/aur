pkgname=osvr-libfunctionality-git
pkgver=v0.1.r12.g7d4f679
pkgrel=1
pkgdesc="A minimal library for dynamically-loaded or statically-linked functionality modules."
arch=(i686 x86_64)
url="https://github.com/OSVR/libfunctionality"
#license=('GPL')
makedepends=('git' 'cmake')
source=("libfunctionality::git+https://github.com/OSVR/libfunctionality.git")

md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/libfunctionality"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/libfunctionality"
}

build() {
  mkdir -p "$srcdir/libfunctionality-build"
  cd "$srcdir/libfunctionality-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../libfunctionality
  make
}

package() {
  cd "$srcdir/libfunctionality-build"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}

# vim:set ts=2 sw=2 et:
