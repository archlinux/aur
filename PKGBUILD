# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-git
pkgver=1.0.8.r9.g2d25dce
pkgrel=1
pkgdesc="The settings application for the COSMIC desktop environment."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings"
license=('GPL-3.0-only')
depends=(
  'accountsservice'
  'adw-gtk-theme'
  'cosmic-icons-git'
  'cosmic-randr-git'
  'fontconfig'
  'iso-codes'
  'libinput'
  'libpipewire'
  'libpulse'
  'libxkbcommon'
  'nm-connection-editor'
  'pipewire-pulse'
  'systemd-libs'
  'ttf-opensans'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
optdepends=(
  'networkmanager: network applet'
  'networkmanager-openvpn: VPN settings'
  'power-profiles-daemon: power profiles'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
