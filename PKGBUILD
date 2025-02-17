# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmos-disks-git
pkgver=r28.06f29d0
pkgrel=1
pkgdesc="Disk management utility for the COSMIC™ desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/stoorps/cosmos-apps"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/stoorps/cosmos-apps.git')
sha256sums=('SKIP')

pkgver() {
  cd "cosmos-apps/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "cosmos-apps/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "cosmos-apps/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release
}

package() {
  cd "cosmos-apps/${pkgname%-git}"
  just rootdir="$pkgdir" install
}
