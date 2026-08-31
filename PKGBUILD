# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: zinzila
# Contributor: Javier Jardón <jjardon@gnome.org>

pkgname=dlt-viewer
pkgdesc='Diagnostic Log and Trace client viewer'
pkgver=2.30.0
pkgrel=1
url='https://github.com/COVESA/dlt-viewer'
arch=(x86_64 i686)
license=('MPL-2.0')
makedepends=('cmake')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'qt6-base'
  'qt6-serialport'
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'dlt-viewer-keep-pie-flag.patch')
b2sums=('1abaa5b388a4130c99a64fb44ef5a99eb76a47823804f532117ac46c4220b58a7977da0ffb173b9dd26e44dedfcf8c5dc83e80f912780e4b3afb50893b9b615d'
        'a3e26a833c41787913b88ad4e75cec2e17d99f350314083200527b303e6dbd8c15298ec2cefc87c36be422fd0cce5ba7f7236579ae2eb65731107818d958fe39')

prepare() {
  cd "dlt-viewer-${pkgver}"

  patch -t -Np1 -i ../dlt-viewer-keep-pie-flag.patch
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D CMAKE_INSTALL_PREFIX=/usr/share/dlt-viewer
    -D DLT_USE_STANDARD_INSTALLATION_LOCATION=OFF
    -D DLT_EXECUTABLE_INSTALLATION_PATH=/usr/bin
    -D DLT_LIBRARY_INSTALLATION_PATH=/usr/lib
    -D DLT_PLUGIN_INSTALLATION_PATH=/usr/lib/dlt-viewer/plugins
    -D DLT_RESOURCE_INSTALLATION_PATH=/usr/share
    -D DLT_ADDITIONAL_FILES_INSTALLATION_PATH=/usr/share/dlt-viewer
    -D DLT_INSTALL_SDK=ON # includes docs
    -D DLT_USE_QT_RPATH=OFF
    -Wno-author
  )
  cmake -B build -S "dlt-viewer-${pkgver}" "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  mv -v "${pkgdir}/usr/share/dlt-viewer/include" "${pkgdir}/usr/include"
  # mostly redundant SDK, only required for docs
  rm -v -rf "${pkgdir}/usr/share/dlt-viewer/sdk"
}
