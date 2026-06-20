# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-vcs
pkgver=0.8.3
pkgrel=1
pkgdesc='Lore is a next-generation, open source version control system'
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9973507858ccfa5d8e157b3bb058b29c811fd900fef34eef209db76af705d8d6')
options=(!lto)

prepare() {
  cd "lore-$pkgver"

  sed -i "s/^version = \"$pkgver-nightly\"/version = \"${pkgver}\"/" Cargo.toml

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --offline --target host-tuple
}

build() {
  cd "lore-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export LORE_BUILD_VERSION_NAME="aur"
  cargo build --frozen --release -p lore-client --bin lore
}

package() {
  cd "lore-$pkgver"
  install -Dm755 "target/release/lore" "$pkgdir/usr/bin/lore"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  "$pkgdir/usr/bin/lore" completions bash >lore-completion-bash
  "$pkgdir/usr/bin/lore" completions zsh >lore-completion-zsh
  install -Dm644 lore-completion-bash "$pkgdir/usr/share/bash-completion/completions/lore"
  install -Dm644 lore-completion-zsh "$pkgdir/usr/share/zsh/site-functions/_lore"
}
