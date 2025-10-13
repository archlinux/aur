# Maintainer:
# Contributor: Martyn van Dijke <martijn_vdijke at hotmail dot com>

: ${_version_gnuradio:=$(LC_ALL=C pacman -Si extra/gnuradio | grep -Pom1 '^Version\s*:\s*\K[0-9]+\.[0-9]+')}

_pkgname="gr-lora_sdr"
pkgname="$_pkgname-git"
pkgver=1.0.0.r136.ga8143cb
pkgrel=2
pkgdesc="GNU Radio blocks for fully-functional LoRa transceiver"
url="https://github.com/tapparelj/gr-lora_sdr"
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

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="tapparelj.gr-lora_sdr"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  # version set in CMakeLists.txt
  git tag 1.0.0 b878d62f054fc3da925c8e3eab77aee150da5d51

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
    'python-gnuradio'
    'python-loudify' # AUR
    'python-pandas'
  )

  DESTDIR="$pkgdir" cmake --install build

  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # create pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"
}
