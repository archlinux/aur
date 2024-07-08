# Maintainer:
# Contributor: Martyn van Dijke <martijn_vdijke at hotmail dot com>

: ${_version_gnuradio:=3.10}

_pkgname="gr-lora_sdr"
pkgname="$_pkgname-git"
pkgver=0.5.r4.g8133965
pkgrel=2
pkgdesc="GNU Radio blocks for fully-functional LoRa transceiver"
url="https://github.com/martynvdijke/gr-lora_sdr"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  "gnuradio>=$_version_gnuradio"
  'python'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'ninja'
  'pybind11'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    'python-loudify' # AUR
    'python-pandas'
  )

  DESTDIR="$pkgdir" cmake --install build
}
