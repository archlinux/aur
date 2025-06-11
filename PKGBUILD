# Maintainer:
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname="airspy"
pkgname="$_pkgname-git"
pkgver=1.0.12.r12.ga379373
pkgrel=1
pkgdesc="Host code for Airspy SDR"
url="https://github.com/airspy/airspyone_host"
license=(
  'GPL-2.0-or-later'         # airspy-tools
  'LicenseRef-AirSpyVarious' # libairspy
)
arch=('i686' 'x86_64')

depends=(
  'libusb'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="airspy.airspyone_host"
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
  local _file _hash _ver _rev _commit
  _file="libairspy/src/airspy.h"
  read -r _hash _ver < <(
    NL=$(awk '/^#define AIRSPY_VERSION "[0-9\.]+"/{n=NR}END{print n}' "$_file")

    git blame -L "$NL,+1" -- "$_file" \
      | awk '{print $1" "$NF }' \
      | sed -E -e 's& "([0-9\.]+)"& \1&'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_commit:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_pkgsrc/airspy-tools/52-airspy.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "airspy.conf" -t "$pkgdir/etc/modprobe.d/"

  install -Dm644 "$_pkgsrc/airspy-tools/LICENSE.md" "$pkgdir/usr/share/licenses/LICENSE-airspy-tools.md"
  install -Dm644 "$_pkgsrc/libairspy/LICENSE.md" "$pkgdir/usr/share/licenses/LICENSE-libairspy.md"
}
