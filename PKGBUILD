# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-session-git
pkgver=r130.ac74753
pkgrel=1
pkgdesc="Session manager for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-session"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'cosmic-applibrary-git'
  'cosmic-applets-git'
  'cosmic-bg-git'
  'cosmic-comp-git'
  'cosmic-greeter-git'
  'cosmic-icons-git'
  'cosmic-launcher-git'
  'cosmic-notifications-git'
  'cosmic-osd-git'
  'cosmic-panel-git'
  'cosmic-randr-git'
  'cosmic-screenshot-git'
  'cosmic-settings-daemon-git'
  'cosmic-settings-git'
  'cosmic-workspaces-git'
  'xdg-desktop-portal-cosmic-git'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
optdepends=(
  'cosmic-edit-git: COSMIC text editor'
  'cosmic-files-git: COSMIC file manager'
  'cosmic-store-git: COSMIC store'
  'cosmic-term-git: COSMIC terminal'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-session.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # libexec > lib
  sed -i 's|libexec|lib|g' Justfile src/main.rs
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just all
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
