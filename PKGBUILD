# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipboard-manager-git
pkgver=0.1.0.r49.g3b4d392
pkgrel=1
pkgdesc="Clipboard manager for COSMIC™"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/clipboard-manager"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'git-lfs'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-clipboard-manager-git')
options=('!lto')  # sqlx crate fails with LTO enabled
source=('git+https://github.com/cosmic-utils/clipboard-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  git lfs install --local
  git remote add network-origin https://github.com/cosmic-utils/clipboard-manager
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
