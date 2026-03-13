# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=splashsurf
pkgver=0.14.0
pkgrel=1
pkgdesc='Surface reconstruction for particle data from SPH simulations'
url="https://github.com/InteractiveComputerGraphics/splashsurf"
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa4a9f523ec963599365867df25fc450ecf3787eb3bd31c1307cc0e9b2c3a818')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
# cargo build --release --locked --bin splashsurf
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features

# cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
# install -Dm755 "target/release/splashsurf" "$pkgdir/usr/bin/splashsurf"

  # Install license if present
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Optional: man page / completions (if project adds them in future)
  # install -Dm644 man/splashsurf.1 "$pkgdir/usr/share/man/man1/splashsurf.1"

  # Optional: bash/zsh/fish completions (if generated)
  # install -Dm644 completions/splashsurf.bash "$pkgdir/usr/share/bash-completion/completions/splashsurf"
}
