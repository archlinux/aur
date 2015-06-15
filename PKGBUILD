# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=bear-git
pkgver=1.4.48.g3e0e1ad
pkgrel=1
pkgdesc="tool to generate compilation database for clang tooling"
arch=('i686' 'x86_64')
url="https://github.com/rizsotto/Bear"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'pkg-config')
depends=('python>=2.7')
conflicts=('bear')
provides=('bear')
source=('bear::git+https://github.com/rizsotto/Bear.git')
sha1sums=('SKIP')
_gitname=bear

build() {
  cd "$srcdir/$_gitname"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    .
  make all
}

check() {
  cd "$srcdir/$_gitname"
  PATH=/usr/bin:$PATH make -k check
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  if [ $CARCH = "x86_64" ]; then
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  fi
}

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
