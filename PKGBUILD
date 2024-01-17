# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Justine Paul <jestine-paul@dsi.a-star.edu.sg>

pkgname='libcs50-git'
_gitname='libcs50'
pkgver=11.0.2.r0.g6d916ef
pkgrel=3
pkgdesc="CS50 Library for C (development version)"
arch=('x86_64' 'i686')
url="https://github.com/cs50/libcs50"
license=('GPL-3.0-only')
groups=('cs50')
depends=('glibc')
makedepends=('git')
optdepends=('clang: compiler currently used in CS50x course (2023)')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(
  'git+https://github.com/cs50/libcs50.git#branch=main'
  'Makefile.patch'
  'Makefile-FLAGS.patch'
)
sha256sums=('SKIP'
            '4a10efd4f4f6b6bb18152a4f28497f7f8562aaa5aaf50c401d308827b922ef3f'
            '777a4af1f33c47eb5bc28b32153603928325b19dd705613d97eaf822e7123752')
install=libcs50.install

pkgver() {
  cd "${_gitname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"

  patch < "${srcdir}/Makefile.patch"
  patch < "${srcdir}/Makefile-FLAGS.patch"
}

build() {
  cd "${_gitname}"
  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
#  CFLAGS= MAKEFLAGS= make
  make
}

package() {
  cd "${_gitname}"

  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
#  CCFLAGS= MAKEFLAGS= DESTDIR="${pkgdir}/usr" make install
  DESTDIR="${pkgdir}/usr" make install

  rm "${pkgdir}/usr/src/cs50.c"
  install -d -m 755 "${pkgdir}/usr/src/libcs50"
  install -m 644 src/cs50.c src/cs50.h -t "${pkgdir}/usr/src/libcs50"
}

# vim: ts=2 sw=2 et:
