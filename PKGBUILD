# Maintainer: ShinKouyo <i@0x0f.dev>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=bakawm-git
_pkgname=bakawm
pkgver=r16.34e87a2
pkgrel=1
pkgdesc="A Wayland window manager built with Rust and Smithay"
arch=(aarch64 armv7h i686 riscv64 x86_64)
url="https://codeberg.org/FuncSonicYEAH/bakawm"
license=('GPL-3.0-or-later')
depends=(
  libdisplay-info
  libdrm
  libei
  libinput
  libpipewire
  libxkbcommon
  mesa
  pixman
  seatd
)
makedepends=(
  cargo
  clang
  git
  # libdisplay-info
  # libinput
  # libpipewire
  # libxkbcommon
  # mesa
  # pixman
  # seatd
)
optdepends=(
  'xorg-xwayland: X11 support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!buildflags')
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  (
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname" || exit 1
  cargo build --release --locked --no-default-features --features " \
    egl, \
    libei, \
    systemd, \
    udev, \
    winit, \
    x11, \
    xdp-gnome-screencast, \
    xwayland"
}

package() {
  cd "$srcdir/$_pkgname" || exit 1
  make DESTDIR="$pkgdir" PREFIX=/usr install
  make DESTDIR="$pkgdir" PREFIX=/usr install-systemd
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
