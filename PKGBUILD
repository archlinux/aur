# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=1.11.0.r4.g2df041e
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
  'libxkbcommon'
  'openssl'
  'pipewire-pulse'
  'systemd-libs'
  'wireplumber'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
optdepends=(
  'breeze-icons: Dark icon theme support for Qt apps'
  'cutecosmic: Theming support for Qt6 apps'
  'playerctl: Media keys support'
  'qt5ct: Theming support for Qt5 apps'
  'qt6ct: Theming support for Qt6 apps'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'lto.patch')
sha256sums=('SKIP'
            'f068a8dcaeb8951c78f6db4daa84af99bf75c3789212bc345a3e0374eb8d53cf')

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
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
