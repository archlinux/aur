# Maintainer: krforshey
pkgname=cosmic-ext-manager
pkgver=0.1.1
pkgrel=2
pkgdesc="DEPRECATED: renamed to cosmic-applet-manager"
arch=('x86_64' 'aarch64')
url='https://github.com/kevinRForshey/CosmicExtensionManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
makedepends=('cargo' 'just' 'pkgconf')
# Rust + C deps (ring) break under makepkg's default LTO flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04e0e3a5d8ac7d60e174a6ad4ceec614d03c5aaedcfba91b020e2715624b5028')

prepare() {
  cd "CosmicExtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "CosmicExtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "CosmicExtensionManager-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --no-default-features
}

package() {
  cd "CosmicExtensionManager-$pkgver"
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
