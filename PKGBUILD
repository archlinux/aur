# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=obs-cmd
pkgver=1.0.3
pkgrel=1
pkgdesc="A minimal OBS CLI for obs-websocket v5"
arch=('x86_64')
url="https://github.com/grigio/obs-cmd"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grigio/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

# Upstream tar.gz
sha512sums=('c00e8c71e53b052e35330246b7469c7bb5a8fa378c760cdf45eb9a3c30421b3d05e92954e6ce585e5235fa900c9c69a51ba2d7ea3c33d8e785733483be0d4e1e')

prepare() {
  cd "${pkgname}-${pkgver}"
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
