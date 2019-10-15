# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

pkgname='ltrace-git'
pkgver=0.7.91.r1410.gea8928d
pkgrel=1
pkgdesc="Debugging program to track runtime library calls in dynamically linked programs"
arch=('x86_64')
url="http://www.ltrace.org/"
license=('GPL2')
depends=('libelf' 'libunwind')
makedepends=('git' 'autoconf')
provides=('ltrace')
conflicts=('ltrace')
source=("$pkgname::git+https://gitlab.com/cespedes/ltrace")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  release=$(grep -oe "AC_INIT(\[ltrace\],\[[0-9.]*\]" configure.ac | grep -oe "[0-9.]*")
  count_commits=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short HEAD)
  echo "${release}.r${count_commits}.g$commit"
}

build() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --without-elfutils \
              --with-libunwind \
              --disable-werror
  make
}

check() {
  cd "$srcdir/$pkgname"

  make -k check || true
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
