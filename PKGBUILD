# Maintainer: Aditya Bhargava <libinput-noaccum.basket389 at slmail dot me>
# This file is a modified version of the Arch libinput PKGBUILD <https://gitlab.archlinux.org/archlinux/packaging/packages/libinput/-/blob/main/PKGBUILD>

_pkgname=libinput
pkgname=libinput-noaccum
pkgver=1.31.2
pkgrel=1
pkgdesc="libinput with ACC_V120_TRIGGER_THRESHOLD set to 1 for smooth high-resolution scrolling"
url="https://wayland.freedesktop.org/libinput/doc/latest/"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
  libevdev
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
provides=(
  libinput
  libinput.so
)
conflicts=(
  libinput  # for versions prior to 1.30.0
  libinput.so
)
source=(
  "git+https://gitlab.freedesktop.org/libinput/libinput.git#tag=$pkgver"
)
b2sums=('8b0a76d3765e06283000745a91c95fecc8d2bfc7da36222ad0def041282f237ebd56006d11efd87c845a936631fea527666fee99b6e9e1e2f176681ff083ac9a')
#validpgpkeys=(
#  3C2C43D9447D5938EF4551EBE23B7E70B467F0BF # Peter Hutterer (Who-T) <office@who-t.net>
#)

prepare() {
  sed -i \
    -e '/^#define ACC_V120_TRIGGER_THRESHOLD 30\>/s/30/1/' \
      "${srcdir}"/$_pkgname/src/libinput-plugin-mouse-wheel.c
}

build() {
  local meson_options=(
    # upstream recommends not building docs
    -D documentation=false
  )

  arch-meson libinput build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package() {
  optdepends=('libinput-tools: debug utilities')

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    _pick tools usr/bin
    _pick tools usr/lib/libinput
    _pick tools usr/share/man
    _pick tools usr/share/zsh
  )

  install -Dm644 libinput/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
