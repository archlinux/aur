# Maintainer: Microck <contact@micr.dev>

pkgname=kagi-cli
pkgver=0.17.0
pkgrel=1
pkgdesc="Agent-native CLI for Kagi subscribers with JSON-first search output"
arch=('x86_64' 'aarch64')
url="https://github.com/Microck/kagi-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('kagi')
conflicts=('kagi')
source=("$pkgname-$pkgver::git+$url.git#commit=fc03e6bb69e5c84926eb836c781552f192b1f346")
sha256sums=('SKIP')

_set_arch_lto_compatible_cflags() {
  # Arch makepkg can add -flto through CFLAGS. ring's C/assembly static objects
  # need fat LTO objects so the final Rust binary can link under those flags.
  CFLAGS+=" -ffat-lto-objects"
  export CFLAGS
}

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  _set_arch_lto_compatible_cflags
  cargo build --frozen --release

  # Generate shell completions
  ./target/release/kagi --generate-completion bash > completions.bash
  ./target/release/kagi --generate-completion zsh > completions.zsh
  ./target/release/kagi --generate-completion fish > completions.fish
}

check() {
  cd "$pkgname-$pkgver"
  _set_arch_lto_compatible_cflags
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 target/release/kagi "$pkgdir/usr/bin/kagi"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Completions
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/kagi"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_kagi"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/kagi.fish"
}
