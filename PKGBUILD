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
pkgver=1.6.0
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
b2sums=('835ee9d98b76fcfa4c94812367855564508b0bf9467f289cd0c37e601be5626482069da64d9b499e6d082ddfaee10c57a3c3191da94d6c2a7fc2c1c1c30c32e1'
        '3c166365d93e6ec47dbec61ed029b2e2c7b5af133bb7ad54bf1033c29ecdf0358458079f20f57099e19dd40e204c225d0956115047c1bb32caaee660a4619e78'
        '8fba952f54d9022d3b42f88bdcc852c5936cb2b9c46016503c8ea48c3565d487cba25f47c74dcbb120d3b96b5b6684cad276ca7c5c62e8ecc344bca17d1a6c22')

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
