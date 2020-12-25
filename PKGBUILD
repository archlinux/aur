# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>

pkgname=libzypp
pkgver=17.25.5
pkgrel=1
pkgdesc="ZYpp Package Management library"
arch=('x86_64')
url="https://github.com/openSUSE/${pkgname}"
license=('GPL')
depends=(
  'boost-libs'
  'gpgme'
  'libproxy'
  'libsigc++'
  'libsolv'
  'libsystemd'
  'libxml2'
  'yaml-cpp'
)
makedepends=(
  'asciidoc'
  'boost'
  'cmake'
  'dejagnu'
  'expat'
  'git'
  'gnupg'
  'graphviz'
  'ninja'
)
source=("${pkgname}-${pkgver}::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('98bdc332ffd5706ea8b1eb751661f19ad3f928d002089d9baca93c59aa4c6e5e')

prepare() {
  # CMake doesn't find FindLibSolv.cmake in /usr/share/cmake/Modules
  cp /usr/share/cmake/Modules/FindLibSolv.cmake "${pkgname}-${pkgver}"/cmake/modules/
  rm -rf build
}

build() {
  cmake \
    -B build \
    -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D LIB=lib \
    -D CMAKE_SKIP_RPATH=1 \
    -D DISABLE_LIBPROXY=0 \
    -D DISABLE_AUTODOCS=1 \
    -D DISABLE_MEDIABACKEND_TESTS=ON \

  cmake --build build
}

check() {
  ARGS="-V" cmake --test build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}"/usr/lib/cmake/Zypp
  mv "${pkgdir}"/usr/share/cmake/Modules/* "${pkgdir}"/usr/lib/cmake/Zypp/
  rm -rf "${pkgdir}"/usr/share/cmake
}
