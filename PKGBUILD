# Maintainer: krforshey
pkgname=cosmic-ext-manager
pkgver=0.1.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/kevinRForshey/CosmicEDxtensionManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
makedepends=('cargo' 'just' 'pkgconf')
# Rust + C deps (ring) break under makepkg's default LTO flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b03556db915d0db208859fe7d6ee373c9e18e6d5f86ad6f86af95a2ec5ab3f1')

prepare() {
  cd "CosmicEDxtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "CosmicEDxtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "CosmicEDxtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --no-default-features
}

package() {
  cd "CosmicEDxtensionManager-$pkgver"
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
