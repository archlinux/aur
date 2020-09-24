# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meye <daan.j.demeyer@gmail.com>
# Contributor: Silvio Knizek <knizek@b1-systems.de>

pkgname=zypper
pkgver=1.14.39
pkgrel=2
pkgdesc="World's most powerful command line package manager"
arch=('x86_64')
url="https://github.com/openSUSE/${pkgname}"
license=('GPL')
depends=(
  'libzypp'
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
provides=('apt')
conflicts=('apt')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/zypper/archive/${pkgver}.tar.gz"
  'make-ZyppCommon-cmake-module-includable.patch'
)
sha256sums=(
  '6a86eef7dc1b6da5021ae032929e10038b7586f8edf8b2e3aeb40f44ee88927d'
  'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cmake \
  -B build \
  -S "${pkgname}-${pkgver}" \
  -G Ninja \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_BUILD_TYPE=Release \
  -D LIB=/lib \
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
