# Maintainer: Cody <aur AT codyps.com>

pkgname=pahole-git
pkgdesc="Various DWARF utils"
pkgver=1.12.r7.g70ef8c7
pkgrel=2
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
depends=('elfutils' 'python2')
makedepends=('git' 'cmake' 'ninja')
provides=('dwarves' 'pahole')
conflicts=('dwarves' 'pahole')
source=(
  $pkgname'::git+https://kernel.googlesource.com/pub/scm/devel/pahole/pahole.git'
  "file://0001-ostra-use-python2.patch"
)
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/0001-ostra-use-python2.patch"  
  mkdir -p build
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname/build"

  cmake -G Ninja \
   -D CMAKE_BUILD_TYPE=Plain \
   -D CMAKE_INSTALL_PREFIX=/usr \
   -D LIB_INSTALL_DIR=/usr/lib \
   ..
  ninja -v
}

package() {
  cd "$srcdir/$pkgname/build"
  DESTDIR=${pkgdir}/ ninja install
}

# vim:set ts=2 sw=2 et:
