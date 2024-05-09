# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-settings-git
pkgver=r278.dd16b92
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
  'otf-fira-mono: Recommended Mono font'
  'otf-fira-sans: Recommended Sans font'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cosmic-settings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  # use nice to build with lower priority
  nice just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
