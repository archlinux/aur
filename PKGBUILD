# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-settings-git
pkgver=r438.6518651
pkgrel=1
pkgdesc="The settings application for the COSMIC desktop environment."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'accountsservice'
  'cosmic-icons-git'
  'cosmic-randr-git'
  'fontconfig'
  'iso-codes'
  'libinput'
  'libxkbcommon'
  'otf-fira-mono'
  'otf-fira-sans'
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
optdepends=(
  'adw-gtk3'
  'power-profiles-daemon: power profiles'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
