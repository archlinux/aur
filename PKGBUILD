# Maintainer:
# Contributor: mi544 (sd32 at protonmail.com)

_pkgname="gummy"
pkgname="$_pkgname-git"
pkgver=0.5.9.r1.g4b48fc3b
pkgrel=1
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="fusco.gummy"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  sed -e '46,48d' -i "$_pkgsrc/gummyd/gummyd/sd-dbus.cpp"
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
