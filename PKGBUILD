# Maintainer: krforshey
pkgname=cosmic-applet-manager
pkgver=0.2.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/kevinRForshey/CosmicAppletManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
makedepends=('cargo' 'just' 'pkgconf')
# Rust + C deps (ring) break under makepkg's default LTO flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f4f255133877e10441323e72f12b847c7549fe95ac1d1564f58b71673531dc2')

prepare() {
  cd "CosmicAppletManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "CosmicAppletManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "CosmicAppletManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --no-default-features
}

package() {
  cd "CosmicAppletManager-$pkgver"
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
