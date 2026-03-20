# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-osd-git
pkgver=1.0.8.r5.g08579ee
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
source=('git+https://github.com/pop-os/cosmic-osd.git'
        'suid-polkit-agent-helper.rs')
sha256sums=('SKIP'
            '21af701c7ca77ebb79d7d5c89632c88e276827d658b2ed3b37b9ea7b5a084c72')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  rustc $RUSTFLAGS -O --edition 2024 suid-polkit-agent-helper.rs

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  cd "${pkgname%-git}"

  # use nice to build with lower priority
  nice just polkit-agent-helper-1="/usr/lib/${pkgname%-git}/suid-polkit-agent-helper" build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm4755 "$srcdir/suid-polkit-agent-helper" -t "$pkgdir/usr/lib/${pkgname%-git}/"
}
