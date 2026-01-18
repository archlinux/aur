# Maintainer: Ajie Pangestu <paangestu@gmail.com>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>

pkgname=pcurses-git
pkgver=5.r185.57c52f7
pkgrel=1
pkgdesc='A curses package management tool using libalpm (git version, patched fork with security fixes)'
arch=('x86_64')
url="https://github.com/ajiepangestu/pcurses"
license=('GPL2')
depends=('ncurses' 'pacman')
makedepends=('git' 'boost' 'cmake')
provides=('pcurses')
conflicts=('pcurses')
source=("git+https://github.com/ajiepangestu/pcurses.git")
sha512sums=('SKIP')

pkgver() {
  cd pcurses
  # Get version from git tags and commits
  # If no tags exist, use commit count
  if git describe --long --tags 2>/dev/null; then
    printf "%s" "$(git describe --long --tags | sed 's/^pcurses-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
  else
    printf "5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}


build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -W no-dev \
        -B build \
        -S pcurses
  make VERBOSE=1 -C build
}

package() {
  make DESTDIR="$pkgdir" install -C build
}

# vim:set ts=2 sw=2 et:
