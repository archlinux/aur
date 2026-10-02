# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=1.9.0.r4.g9e7a41b
pkgrel=1
pkgdesc="Cosmic settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-only')
depends=(
  'acpid'
  'adw-gtk-theme'
  'cosmic-sound-theme-git'
  'libinput'
  'libpipewire'
  'libpulse'
  'playerctl'
  'systemd-libs'
  'wireplumber'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'libxkbcommon'
  'mold'
)
optdepends=(
  'breeze-icons'
  'qt5ct'
  'qt6ct'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'lto.patch')
sha256sums=('SKIP'
            '52fb9e1690580a21e8fdc4f5f016e45f01e08b16a29c09bfef59660a3ea9531a')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
