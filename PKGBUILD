# Maintainer: Cody <aur AT codyps.com>

pkgname=pahole-git
pkgdesc="Various DWARF utils"
pkgver=1.13.r6.g568dae4
pkgrel=2
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
depends=('elfutils' 'python' 'libbpf' 'zlib')
makedepends=('git' 'cmake' 'ninja')
provides=('dwarves' 'pahole')
conflicts=('dwarves' 'pahole')
source=("$pkgname::git+https://git.kernel.org/pub/scm/devel/pahole/pahole.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cmake -S "$srcdir/$pkgname" -B "$srcdir/build" -G Ninja \
   -D LIBBPF_EMBEDDED=OFF \
   -D CMAKE_BUILD_TYPE=None \
   -D CMAKE_INSTALL_PREFIX=/usr \
   -D LIB_INSTALL_DIR=/usr/lib

  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}

# vim:set ts=2 sw=2 et:
