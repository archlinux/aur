# Maintainer:
# Contributor: mi544 (sd32 at protonmail.com)

_pkgname="gummy"
pkgname="$_pkgname"
pkgver=0.5.9
pkgrel=2
pkgdesc="Screen brightness/temperature manager for Linux"
url="https://codeberg.org/fusco/gummy"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'ddcutil'
  'fmt'
  'libxcb'
  'sdbus-cpp'
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

install="$_pkgname.install"

_pkgsrc="fusco.gummy"
source=(
  "$_pkgsrc"::"git+$url.git#tag=$pkgver"
  "revert-e3a89af.patch"
)
sha256sums=(
  'b29fdb78b98ff5ef17be3ddf13e9f28a5126b6f1b1149b4144c029830389e5c3'
  '5840c40eb942e82be88319c252bccfa921a034e7706dbc5f277f8ba886cd8feb'
)

prepare() {
  cd "$_pkgsrc"

  # fix glib cxx assert error
  patch -Np1 -i "../revert-e3a89af.patch"

  # fix struct redefinition error
  sed -e '46,48d' -i "gummyd/gummyd/sd-dbus.cpp"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE='Release'
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$_pkgname"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
