# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Justine Paul <jestine-paul@dsi.a-star.edu.sg>

pkgname='libcs50-git'
_gitname='libcs50'
pkgver=10.1.0.r0.gb5d03d3
pkgrel=1
pkgdesc="CS50 Library for C (development version)"
arch=('x86_64' 'i686')
url="https://github.com/cs50/libcs50"
license=('MIT')
groups=('cs50')
makedepends=('asciidoctor' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(
  'git+https://github.com/cs50/libcs50.git#branch=master'
  'Makefile.patch'
)
sha256sums=(
  'SKIP'
  '4a10efd4f4f6b6bb18152a4f28497f7f8562aaa5aaf50c401d308827b922ef3f'
)

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
  CFLAGS= MAKEFLAGS= DESTDIR="${pkgdir}/usr" make install

  rm "${pkgdir}/usr/src/cs50.c"
  install -d -m 755 "${pkgdir}/usr/src/libcs50"
  install -m 644 src/cs50.c src/cs50.h -t "${pkgdir}/usr/src/libcs50"
}

# vim: ts=2 sw=2 et:
