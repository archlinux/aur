# Maintainer:
# Contributor: mi544 (sd32 at protonmail.com)

: ${_sdbus_ver=1.6.0}

_pkgname="gummy"
pkgname="$_pkgname-git"
pkgver=0.6.1.r0.gb5f468c
pkgrel=1
pkgdesc="Screen brightness/temperature manager for Linux"
url="https://codeberg.org/fusco/gummy"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'ddcutil'
  'fmt'
  'libatomic'
  'libxcb'
  'spdlog'
  'systemd-libs'
  'xcb-util-image'
)
makedepends=(
  'cli11'
  'cmake'
  'git'
  'ninja'
  'nlohmann-json'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="fusco.gummy"
_pkgsrc_sdbus="sdbus-cpp-$_sdbus_ver"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_sdbus.tar.gz"::"https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v$_sdbus_ver.tar.gz"
)
sha256sums=(
  'SKIP'
  '7ec8a2565bfc8f975c7ee528cb292021063ed793d6864c1c8733ca10ff906164'
)

prepare() {
  cd "$_pkgsrc"
  sed -e '/find_package(sdbus-c++/i find_package(PkgConfig REQUIRED)\
pkg_check_modules(Systemd REQUIRED IMPORTED_TARGET libsystemd)' -i gummyd/gummyd/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -G Ninja
    -DCMAKE_BUILD_TYPE='None'
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$_pkgname"
    -Wno-dev
  )

  local _cmake_options_sdbus=(
    -B build_deps
    -S "$_pkgsrc_sdbus"
    -DBUILD_SHARED_LIBS=OFF
  )

  cmake "${_cmake_options[@]}" "${_cmake_options_sdbus[@]}"
  cmake --build build_deps
  DESTDIR="$srcdir/deps" cmake --install build_deps

  local _cmake_options_gummy=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
  )

  cmake "${_cmake_options[@]}" "${_cmake_options_gummy[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
