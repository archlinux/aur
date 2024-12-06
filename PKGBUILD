# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=wlclock
pkgname=$_pkgname-git
pkgver=r5.bec08da
pkgrel=1
pkgdesc="Simple GTKmm/Cairo based clock that works on Wayland "
arch=('i686' 'x86_64')
depends=('gtkmm3')
makedepends=('cmake' 'pkgconf')
url="https://github.com/Depau/wlclock"
license=('GPL3' 'FDL')
source=(${_pkgname}::git+https://github.com/Depau/wlclock.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgname}"

  mkdir -p build && cd build
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install -C build/
}
