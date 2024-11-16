# Maintainer:
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname="airspy"
pkgname="$_pkgname-git"
pkgver=1.0.10.r24.g43570b6
pkgrel=1
pkgdesc="Host code for Airspy SDR"
url="https://github.com/airspy/host"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'libusb'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="airspyone_host"
source=(
  "$_pkgsrc"::"git+$url.git"
  "airspy.conf"
)
sha256sums=(
  'SKIP'
  'b210dd0698c3bb8ad59f0393c12a74e1ed8fe1b16a2faabc38467f68ebed0120'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
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
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_pkgsrc/airspy-tools/52-airspy.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "airspy.conf" -t "$pkgdir/etc/modprobe.d/"
}
