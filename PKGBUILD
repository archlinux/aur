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
pkgver=1.3.0
pkgrel=2
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
b2sums=('3ceb9e187ce87a5b9e7ea576f26bae2c386d1af2eb18e207bb7b62e728d05be99537149cb7f750574feb12fe87d4c8ceea921fcb48bdc29f38f35979dacf84b2'
        '875442d125d263031ef9b5ed21963fa0d34b0300592ca2d53e4f8952c4cb6d5633c7959799732686ac0b9f46548fb87251bc82b160b7dd683e8f4d265e71e644'
        '95cbf2955323c3e47b7b65d8162c6c12655d31a9bd49ccd2a21d30b2febfbbf4197e0d8323fbac0c8ecc71baa64f75bc8c00013b5fb1376402c0214ec08f976b')

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
