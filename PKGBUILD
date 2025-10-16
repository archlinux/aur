# Maintainer: Devin Alexander Torres <d@devinus.io>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>

# shellcheck shell=bash
# shellcheck disable=2034,2154,2312

_pkgbase=mimalloc
pkgname=mimalloc-git
pkgver=3.0.2.beta.r19.g15f2a9c7
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('glibc')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}#branch=dev3")
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "${pkgname}" || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -S "${pkgname}" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBEXECDIR=lib \
    -D MI_BUILD_OBJECT=OFF \
    -D MI_INSTALL_TOPLEVEL=ON

  cmake --build build
}

check() {
  cd build || exit 1
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"

  # Create a symlink for mimalloc 2.x compatibility (needed by e.g. mold)
  ln -sv libmimalloc.so "${pkgdir}/usr/lib/libmimalloc.so.2"
}
