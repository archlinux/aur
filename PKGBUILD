# Maintainer: krforshey
pkgname=cosmic-applet-manager
pkgver=0.3.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions'
arch=('x86_64' 'aarch64')
url='https://github.com/kevinRForshey/CosmicAppletManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('flatpak: sandboxed installs (the default)' 'flatpak-builder: sandboxed installs (the default)' 'python: sandboxed installs and Flatpak packaging')
makedepends=('cargo' 'just' 'pkgconf')
# Rust + C deps (ring) break under makepkg's default LTO flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9ed10460a03af9cd064614a168e67f2c2d476cdf11ced16698e3ccfda08f245')

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
