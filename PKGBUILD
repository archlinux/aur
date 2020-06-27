# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>

pkgname=libzypp
pkgver=17.24.1
pkgrel=1
pkgdesc="Package, Patch, Pattern, and Product Management"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp"
license=('GPL')
depends=(
  'boost-libs'
  'gpgme'
  'libproxy'
  'libsigc++'
  'libsolv'
  'libsystemd'
  'libxml2'
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
source=("${pkgname}-${pkgver}::https://github.com/openSUSE/libzypp/archive/${pkgver}.tar.gz")
sha256sums=('fcb44a4ce56d6976e15267206971d6a98641964a16ccc601e854056b4b7874cb')

prepare() {
  # CMake doesn't find FindLibSolv.cmake in /usr/share/cmake/Modules
  cp /usr/share/cmake/Modules/FindLibSolv.cmake "${pkgname}-${pkgver}"/cmake/modules/

  # Remove once https://github.com/openSUSE/libzypp/pull/236 is merged/released.
  sed -i '15,16 s/^/\/\//' "${pkgname}-${pkgver}"/zypp/parser/xml/libxmlfwd.h
  sed -i '19 s/^/\/\//' "${pkgname}-${pkgver}"/zypp/parser/xml/libxmlfwd.h

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

  ninja -C build
}

# check() {
#   ninja -C build test
# }

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}"/usr/lib/cmake/Zypp
  mv "${pkgdir}"/usr/share/cmake/Modules/* "${pkgdir}"/usr/lib/cmake/Zypp/
  rm -rf "${pkgdir}"/usr/share/cmake
}
