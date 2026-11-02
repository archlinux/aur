# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=obs-cmd
pkgver=1.0.2
pkgrel=2
pkgdesc="A minimal OBS CLI for obs-websocket v5"
arch=('x86_64')
url="https://github.com/grigio/obs-cmd"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grigio/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

# Upstream tar.gz
sha512sums=('8ed18325f22f379ee159c3f6eec1093f6b41918ccb95fe8796383c8aef707243eeec4dcf2c4f96123532af93e3d0b03512e22eba6a5c4119cfe4e2cf470f8cbd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Upstream v1.0.2 left the root package version at 1.0.1 in Cargo.lock.
  sed -i '/^name = "obs-cmd"$/{n;s/^version = "1.0.1"$/version = "1.0.2"/;}' Cargo.lock
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_STRIP=false
  cargo build --frozen --release

  mkdir -p completions
  local shell
  for shell in bash zsh fish; do
    target/release/obs-cmd completion "$shell" > "completions/$shell"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/obs-cmd "$pkgdir/usr/bin/obs-cmd"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/obs-cmd"
  install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_obs-cmd"
  install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/obs-cmd.fish"
}
