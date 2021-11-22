# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>

pkgname=libzypp
pkgver=17.28.8
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
  'doxygen'
  'expat'
  'git'
  'gnupg'
  'graphviz'
  'ninja'
  'protobuf'
)
source=("${pkgname}-${pkgver}::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1b9a1d3f5d0a8042161181330f47838e13210ac0a862ad3ea19b7e8ae783ae38')

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
    -D DISABLE_MEDIABACKEND_TESTS=ON \
	-D ENABLE_BUILD_DOCS=ON \
	-D ENABLE_BUILD_TRANS=ON \
	-D ENABLE_BUILD_TESTS=ON \
	-D ENABLE_ZCHUNK_COMPRESSION=ON \
	-D ENABLE_ZSTD_COMPRESSION=ON \

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}"/usr/lib/cmake/Zypp
  mv "${pkgdir}"/usr/share/cmake/Modules/* "${pkgdir}"/usr/lib/cmake/Zypp/
  rm -rf "${pkgdir}"/usr/share/cmake
}
