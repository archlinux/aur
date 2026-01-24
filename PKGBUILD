# Maintainer:

_pkgname="aelkey"
pkgname="$_pkgname-git"
pkgver=0.0.1.r0.gbd7e0d4
pkgrel=1
pkgdesc="Lua-based input remapping framework"
url="https://github.com/xiota/aelkey"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'dbus'
  'libevdev.so'
  'libudev.so'
  'libusb-1.0.so'
  'lua'
)
makedepends=(
  'cli11'
  'git'
  'go-md2man'
  'linux-api-headers'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
_pkgsrc_sol="nerixyz.sol2"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_sol"::"git+https://github.com/Nerixyz/sol2.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/$_pkgsrc_sol" "$_pkgsrc/subprojects/sol2"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # api reference
  go-md2man -in "$_pkgsrc/docs/aelkey-reference.md" \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man7/aelkey.7"

  # udev rules
  install -Dm644 "$_pkgsrc/data"/*.rules -t "$pkgdir/usr/share/$_pkgname/"

  # sysusers config
  install -Dm644 "$_pkgsrc/data"/sysusers*.conf -t "$pkgdir/usr/share/$_pkgname/"
}
