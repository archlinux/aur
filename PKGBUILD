# Maintainer:

_pkgname="aelkey"
pkgname="$_pkgname"
pkgver=0.0.1
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

_pkgsrc="$_pkgname"
_pkgsrc_sol="nerixyz.sol2"
source=(
  "$_pkgsrc"::"git+$url.git#tag=$pkgver"
  "$_pkgsrc_sol"::"git+https://github.com/Nerixyz/sol2.git"
)
sha256sums=(
  '56ebab4d190c3c772315cedab89feaf6d8b650690ac32c5082d2e18837a7c3b0'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/$_pkgsrc_sol" "$_pkgsrc/subprojects/sol2"
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
