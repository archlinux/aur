# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Justine Paul <jestine-paul@dsi.a-star.edu.sg>

pkgname='libcs50-git'
_gitname='libcs50'
pkgver=11.0.1.r4.gc5bead0
pkgrel=2
pkgdesc="CS50 Library for C (development version)"
arch=('x86_64' 'i686')
url="https://github.com/cs50/libcs50"
license=('GPL3')
groups=('cs50')
makedepends=('git')
optdepends=('clang: compiler currently used in CS50x course (2023)')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(
  'git+https://github.com/cs50/libcs50.git#branch=main'
  'Makefile.patch'
)
sha256sums=(
  'SKIP'
  '4a10efd4f4f6b6bb18152a4f28497f7f8562aaa5aaf50c401d308827b922ef3f'
)
install=libcs50.install

pkgver() {
  cd "${_gitname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"

  patch < "${srcdir}/Makefile.patch"
}

build() {
  cd "${_gitname}"

  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
  CFLAGS= MAKEFLAGS= make
}

package() {
  cd "${_gitname}"

  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
  CCFLAGS= MAKEFLAGS= DESTDIR="${pkgdir}/usr" make install

  rm "${pkgdir}/usr/src/cs50.c"
  install -d -m 755 "${pkgdir}/usr/src/libcs50"
  install -m 644 src/cs50.c src/cs50.h -t "${pkgdir}/usr/src/libcs50"
}

# vim: ts=2 sw=2 et:
