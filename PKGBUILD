# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-randr-vrr-fix
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc='Library and utility for displaying and configuring Wayland outputs (VRR fix)'
arch=(x86_64)
url=https://github.com/skygrango/cosmic-randr
license=(MPL-2.0)
groups=(cosmic)
provides=(cosmic-randr)
conflicts=(cosmic-randr)
depends=(
  libgcc
  glibc
  wayland
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  'cosmic-randr::git+https://github.com/skygrango/cosmic-randr.git#branch=vrr_target_rate_v2'
  'cosmic-randr-lto.patch'
)
b2sums=(
  'SKIP'
  '3bcdff90827243e43c4c581a8982a2739c339a98de089739c0ceaea2fdd76e555bde0a81a52f3603ee3cf7ccf8cf9e1410fd7211e445252fda7ce909ce13d776'
)

prepare() {
  cd cosmic-randr
  patch -Np1 -i ../cosmic-randr-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-randr
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-randr
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
