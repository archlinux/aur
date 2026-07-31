# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-comp-vrr-fix
pkgver=1.5.0
pkgrel=3
epoch=1
pkgdesc='Compositor for the COSMIC desktop environment'
arch=(x86_64)
url='https://github.com/pop-os/cosmic-comp'
license=(GPL-3.0-only)
groups=(cosmic)
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
provides=(cosmic-comp)
conflicts=(cosmic-comp)
makedepends=(
  cargo
  git
  lld
)
# Build Skygrango's VRR target-rate branch with the live adaptive-sync update from PR #2673.
source=('cosmic-comp::git+https://github.com/AdityaHebballe/cosmic-comp.git#branch=vrr_target_rate_v2-live-sync')
b2sums=('SKIP')

prepare() {
  cd cosmic-comp

  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-comp
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release"
}

package() {
  cd cosmic-comp
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
