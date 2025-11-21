# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-osd-git
pkgver=1.0.0.beta.7.r1.gfe84308
pkgrel=1
pkgdesc="COSMIC On-Screen Display"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-osd"
license=('GPL-3.0-only')
depends=(
  'cosmic-randr-git'
  'libinput'
  'libpipewire'
  'libpulse'
  'libxkbcommon'
  'sound-theme-freedesktop'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-osd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  sed 's|libexec|lib/polkit-1|g' -i justfile src/subscriptions/polkit_agent_helper.rs
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
