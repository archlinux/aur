# Maintainer: Cody <aur AT codyps.com>

pkgname=pahole-git
pkgdesc="Various DWARF utils"
pkgver=1.13.r6.g568dae4
pkgrel=1
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
depends=('elfutils' 'python')
makedepends=('git' 'cmake' 'ninja')
provides=('dwarves' 'pahole')
conflicts=('dwarves' 'pahole')
source=(
  $pkgname::'git+https://kernel.googlesource.com/pub/scm/devel/pahole/pahole.git'
  'git+https://github.com/libbpf/libbpf'
)
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.libbpf.url "$srcdir/libbpf"
  git submodule update
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/build"

  cmake -G Ninja \
   -D CMAKE_BUILD_TYPE=Plain \
   -D CMAKE_INSTALL_PREFIX=/usr \
   -D LIB_INSTALL_DIR=/usr/lib \
   ../"$pkgname"

  ninja -v
}

package() {
  cd "$srcdir/build"
  DESTDIR=${pkgdir}/ ninja install
}

# vim:set ts=2 sw=2 et:
