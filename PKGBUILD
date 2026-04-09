# Maintainer: Aleks Clark <aleks@aleksclark.com>
pkgname=awesometree
pkgver=2026.4.8
pkgrel=1
pkgdesc="Workspace manager: window management + Zed + git worktrees"
arch=('x86_64')
url="https://github.com/aleksclark/awesometree"
license=('MIT')
depends=('gtk3' 'vulkan-icd-loader' 'wayland' 'libxkbcommon' 'libxcb' 'freetype2' 'fontconfig' 'openssl')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aleksclark/awesometree/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09fa159ba787f9a38559c34a3e5cf005f61afd3583d34ae776edf9862d31ae11')

prepare() {
  cd "awesometree-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "awesometree-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "awesometree-${pkgver}"
  install -Dm755 target/release/awesometree "${pkgdir}/usr/bin/awesometree"
  install -Dm755 target/release/awesometree-daemon "${pkgdir}/usr/bin/awesometree-daemon"
  install -Dm644 awesometree-daemon.service "${pkgdir}/usr/lib/systemd/user/awesometree-daemon.service"
}
