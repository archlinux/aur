# Maintainer:
# Contributor: Clayton Craft <clayton at craftyguy dot net>

_pkgname="hidviz"
pkgname="$_pkgname"
pkgver=0.2.1
pkgrel=1
pkgdesc="Tool for in-depth analysis of USB HID devices communication"
url="https://github.com/hidviz/hidviz"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'libusb'
  'protobuf'
  'qt6-base'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

options=('!emptydirs')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('ceec5d8c284cad8f7abeda2862ee6b815431a38d664eed24f3a98a10294f4e42')

prepare() {
  # fix missing absl symbols
  sed -e '/find_package(Protobuf REQUIRED)/a find_package(absl REQUIRED)' \
    -e '/asio/a absl_log_internal_message absl_log_internal_check_op absl_log_internal_nullguard' \
    -i "$_pkgsrc/libhidx/libhidx_server/CMakeLists.txt"

  # fix libexec path
  sed -e '/"\/usr\/local\/libexec"/a "/usr/bin", "/usr/lib", "/usr/lib/'"${_pkgname}"'",' \
    -i "$_pkgsrc/libhidx/libhidx/src/Connector.cc"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$_pkgname"
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}
package() {
  DESTDIR="$pkgdir" cmake --install build

  # move icon
  mkdir -pm755 "$pkgdir/usr/share/pixmaps/"
  mv "$pkgdir/usr/share/icons/hicolor/128x128/apps/hidviz.png" "$pkgdir/usr/share/pixmaps/"
  rmdir -p --ignore-fail-on-non-empty "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
}
