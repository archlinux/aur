# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-initial-setup-git
pkgver=1.0.0.beta.1.1.r42.g947186e
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
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
