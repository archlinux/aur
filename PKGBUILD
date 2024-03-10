# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=3.4.3
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE"
arch=('i686' 'x86_64')
url="https://github.com/jeromerobert/${pkgname}"
license=('GPL-2.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'kconfig5'
  'kconfigwidgets5'
  'kcoreaddons5'
  'ki18n5'
  'kiconthemes5'
  'kio5'
  'kxmlgui5'
  'kwidgetsaddons5'
  'qt5-base'
  'zlib'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
)
_tarname="${pkgname}-${pkgver}"
source=("${_tarname}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('c87a5c0d37616607e2c7bcd95803f3d4411b6331fa259d899245773d91dd5b0b5ececae658f4fb80536dedde972a69ebded5442be79e3993a5857f2db07a136f')

prepare() {
  printf "Removing unneeded KJobWidgets dependency from CMakeLists.txt..."
  sed \
    -e 's/JobWidgets //' \
    -i "${_tarname}/CMakeLists.txt"
  printf " done.\n"

  printf "Removing unneeded Qt5 Widgets (Qt5 Declarative) dependency from CMakeLists.txt..."
  sed \
    -e 's/\(Qt5 REQUIRED COMPONENTS\) Widgets/\1 Core/' \
    -i "${_tarname}/CMakeLists.txt"
  printf " done.\n"

  cmake -B build -S "${_tarname}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_TESTING='OFF'
}

build() {
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
