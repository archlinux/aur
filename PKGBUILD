# Maintainer: xuanping <a845326948 at gmail dot com>
# Based on the official Arch cosmic-comp package:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

# Stock cosmic-comp plus a small, additive patch that exports the compositor's
# already-tracked Wayland idle-inhibitors over the session bus as
# com.system76.CosmicComp.IdleInhibit.ListInhibitors() -> a(us) [(pid, app_id)].
# This is the only channel that knows about zwp_idle_inhibit holders (e.g. a
# browser playing video), which no other component can enumerate. Consumed by
# cosmic-ext-applet-inhibit-status. Upstream PR pop-os/cosmic-comp#2552.

_srcname=cosmic-comp
pkgname=cosmic-comp-inhibit-export
pkgver=1.3.0
pkgrel=1
epoch=1
pkgdesc='Compositor for the COSMIC desktop environment (patched to export Wayland idle-inhibitors over D-Bus)'
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
        idle-inhibit-export.patch)
b2sums=('3ceb9e187ce87a5b9e7ea576f26bae2c386d1af2eb18e207bb7b62e728d05be99537149cb7f750574feb12fe87d4c8ceea921fcb48bdc29f38f35979dacf84b2'
        '95cbf2955323c3e47b7b65d8162c6c12655d31a9bd49ccd2a21d30b2febfbbf4197e0d8323fbac0c8ecc71baa64f75bc8c00013b5fb1376402c0214ec08f976b')

prepare() {
  cd $_srcname
  patch -Np1 -i "$srcdir/idle-inhibit-export.patch"
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd $_srcname
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release"
}

package() {
  cd $_srcname
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
