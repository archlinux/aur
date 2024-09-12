# Maintainer:
# Contributor: Henry Jenkins <archlinux.org@henryjenkins.com>

: ${_version_gnuradio:=3.10}

_pkgname="gr-adsb"
pkgname="$_pkgname-git"
pkgver=r212.0f36000
pkgrel=2
pkgdesc="GNURadio blocks for receiving ADS-B modulated radio messages using SDR"
url="https://github.com/mhostetter/gr-adsb"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  "gnuradio>=$_version_gnuradio"
  'python'
  'python-numpy'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/mhostetter/gr-adsb#branch=maint-$_version_gnuradio")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
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
    'python-colorama'
  )

  DESTDIR="$pkgdir" cmake --install build
}
