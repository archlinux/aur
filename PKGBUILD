# Maintainer: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgname=libinput
pkgname=$_pkgname-three-finger-drag
pkgver=1.31.3
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://wayland.freedesktop.org/libinput/doc/latest/"
arch=(x86_64)
license=(MIT)
provides=(
  "$_pkgname=$pkgver"
  "$_pkgname-tools=$pkgver"
  libinput.so
)
conflicts=(
  "$_pkgname"
  "$_pkgname-tools"
)
depends=(
  glibc
  libevdev
  libgcc
  libwacom
  lua54
  mtdev
  systemd-libs
)
makedepends=(
  cairo
  check
  git
  glib2
  gtk4
  libx11
  meson
  python
  python-libevdev
  python-pyudev
  python-yaml
  wayland
  wayland-protocols
)
checkdepends=(python-pytest)
source=(
  "git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git?signed#tag=$pkgver"
  0001-meson-build-options-for-3-4-finger-dragging.patch
)
b2sums=(
  'SKIP'
  '58ef451c3c28748b60a7ed928059b43c7b17df6e5fb6cf990d2d745e0fc3e3dd3ad9e0076007e83c0c491a9e12813f5eba49b1a9c390ec58cf0ca8206743e190'
)
validpgpkeys=(
  3C2C43D9447D5938EF4551EBE23B7E70B467F0BF # Peter Hutterer (Who-T) <office@who-t.net>
)

prepare() {
  cd $_pkgname
  patch -Np1 -i "$srcdir/0001-meson-build-options-for-3-4-finger-dragging.patch"
}

build() {
  local meson_options=(
    # upstream recommends not building docs
    -D documentation=false
    # ship 3-finger drag enabled by default
    -D 3fg-drag-default=3fg
    # always commit to a drag at the 80ms timeout, never to a 3fg swipe
    -D 3fg-drag-always-drag=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 $_pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
