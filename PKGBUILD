# Maintainer: xuanping <a845326948 at gmail dot com>
# Based on the official Arch cosmic-comp package:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

# Stock cosmic-comp plus two small, additive out-of-tree patches:
#  1. idle-inhibit-export: expose active Wayland idle-inhibitors over the session
#     bus as com.system76.CosmicComp.IdleInhibit.ListInhibitors() -> a(us)
#     [(pid, app_id)] -- the only channel that knows zwp_idle_inhibit holders
#     (e.g. a browser playing video). Upstream PR pop-os/cosmic-comp#2552.
#     Consumed by cosmic-ext-applet-inhibit-status.
#  2. custom-accel (upstream PR pop-os/cosmic-comp#2397): support libinput
#     `Custom` acceleration profiles (custom_points), enabling arbitrary
#     touchpad/pointer accel curves. DORMANT unless a config selects
#     `profile: Custom` -- default behaviour is byte-for-byte stock. Pairs with
#     the cosmic-comp-macos-touchpad-curve package.

_srcname=cosmic-comp
pkgname=cosmic-comp-inhibit-export
pkgver=1.4.0
pkgrel=1
epoch=1
pkgdesc='cosmic-comp with additive patches: Wayland idle-inhibitor D-Bus export + libinput custom accel-curve support (PR#2397)'
arch=(x86_64)
url='https://github.com/pop-os/cosmic-comp'
license=(GPL-3.0-only)
provides=("cosmic-comp=${epoch}:${pkgver}")
conflicts=(cosmic-comp)
depends=(
  fontconfig
  libgcc
  glibc
  libdisplay-info
  libseat.so
  libinput
  libxcb
  libxkbcommon
  mesa
  pixman
  systemd-libs
  wayland
)
makedepends=(
  cargo
  git
  lld
)
source=(git+https://github.com/pop-os/cosmic-comp.git#tag=epoch-${pkgver}
        pr2397-custom-accel.patch
        idle-inhibit-export.patch)
b2sums=('410c4d437150473daf8e2beabe73431d0705d5417c94f29705c471d0912bd3b60b38be562f863d83e7beaf4a6cce683068b2a2158395f86fea0643844fcf8c7f'
        'f08c77cdece50d7e0e461d8094d873994cec43e06fb6c58770d61a3b2e74e083c18235ac2ba6300bf6a2ac4ce224612b1abde2d2d5e436d3af413411283a0859'
        'dc885fe24c61e494ffdab3a50648494877314657b74a3cda9219178d207fc552f8306e18d1eb5737330df73881e8839bf253a3f4d9a2b18c5c56a6c6b9fb18dc')

prepare() {
  cd $_srcname
  # Additive, non-overlapping patches (different files); order is not critical.
  patch -Np1 -i "$srcdir/pr2397-custom-accel.patch"
  patch -Np1 -i "$srcdir/idle-inhibit-export.patch"
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd $_srcname
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release --features custom-accel"
}

package() {
  cd $_srcname
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
