# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

_pkgname=zypper
pkgname=${_pkgname}-git
pkgver=1.14.39.3.g1d28e66a
pkgrel=1
pkgdesc="World's most powerful command line package manager"
arch=('x86_64')
url="https://github.com/openSUSE/${_pkgname}"
license=('GPL')
depends=(
  'libzypp-git'
  'libxml2'
  'procps'
  'readline'
  'augeas'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'boost'
  'asciidoc'
  'asciidoctor'
)
provides=(
  "${_pkgname}"
  'apt'
)
conflicts=(
  "${_pkgname}"
  'apt'
)
source=(
  "${pkgname}::git+https://github.com/openSUSE/${_pkgname}.git"
  'make-ZyppCommon-cmake-module-includable.patch')
sha256sums=(
  'SKIP'
  'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7'
)

pkgver() {
  cd "${pkgname}"
  echo $(git describe --always | sed -r 's/-/./g')
}

prepare() {
  cd "${pkgname}"
  patch -p1 -i ../make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cmake \
  -B build \
  -S "${pkgname}" \
  -G Ninja \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_BUILD_TYPE=Release \
  -D LIB=lib \
  -D ZYPP_PREFIX=/usr \

  cmake --build build
}

check() {
  ARGS="-V" cmake --test build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # hacky sbin symlink fix
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin"
}
