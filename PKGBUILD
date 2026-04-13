# Maintainer: Hannes Hapke <hannes.hapke@gmail.com>
pkgname=yaak-cli
_pkgname=yaak
pkgver=0.1.4
pkgrel=1
pkgdesc="Translate natural language to bash commands using any OpenAI-compatible LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/hanneshapke/yaak"
license=('Apache-2.0')
provides=('yaak' 'yaak-cli-bin')
conflicts=('yaak' 'yaak-cli-bin')
depends=('gcc-libs')
makedepends=('cargo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hanneshapke/yaak/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e266ec065a96e71b07b4529d1fe1029c45bda27679d789a31060efa336502b4c')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Shell completions generated at runtime by the yaak binary itself.
  "$pkgdir/usr/bin/$_pkgname" --completions bash | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" --completions zsh | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" --completions fish | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
