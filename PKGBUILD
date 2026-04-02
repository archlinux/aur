# Maintainer: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgname=libinput
pkgname=$_pkgname-three-finger-drag
pkgver=1.31.1
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
  0001-enable-3fg-drag-by-default.patch
)
b2sums=(
  'SKIP'
  'c6750706f74ac6e83df1d0e0981446fa117af8d1b72256f26242ed2ed616ae037da6d5eefe7ad86d9b81e19f4e762fb5f217de2f09f800d7bcff772e587c8226'
)
validpgpkeys=(
  3C2C43D9447D5938EF4551EBE23B7E70B467F0BF # Peter Hutterer (Who-T) <office@who-t.net>
)

prepare() {
  cd $_pkgname
  patch -Np1 -i "$srcdir/0001-enable-3fg-drag-by-default.patch"
}

build() {
  local meson_options=(
    # upstream recommends not building docs
    -D documentation=false
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
