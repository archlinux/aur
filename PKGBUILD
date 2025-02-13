# Maintainer: Devin Alexander Torres <d@devinus.io>

# shellcheck shell=bash
# shellcheck disable=2034,2154,2312

_pkgbase=snmalloc
pkgname=snmalloc-git
pkgver=0.7.1.r4.gef474828
pkgrel=1
pkgdesc="Message passing based allocator"
arch=('x86_64')
url="https://github.com/microsoft/snmalloc"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || exit 1
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -S "${_pkgbase}" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SNMALLOC_NO_REALLOCARRAY=OFF \
    -D SNMALLOC_STATIC_LIBRARY=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" "${_pkgbase}/LICENSE"
}
