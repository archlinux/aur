# Maintainer: Mark Wagie <mark dot wage at proton dot me>
pkgname=cosmic-initial-setup-git
pkgver=r28.25a77b7
pkgrel=1
pkgdesc="COSMIC Initial Setup"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-initial-setup"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'libinput'
  'libpulse'
  'libxkbcommon'
  'polkit'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'git-lfs'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/pop-os/cosmic-initial-setup.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-initial-setup
  git lfs fetch network-origin
  git lfs checkout
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
