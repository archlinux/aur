# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-vcs
pkgver=0.8.6
pkgrel=1
pkgdesc='Lore is a next-generation, open source version control system'
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('970db12225658bc4b97cb92c43381117778e26609e4bde85f49dbed9553e8b09')
options=(!lto)

prepare() {
  cd "lore-$pkgver"

  sed -i "s/^version = \"0.8.6-nightly\"/version = \"${pkgver}\"/" Cargo.toml
  sed -i "s/^version = \"0.8.6-nightly\"/version = \"${pkgver}\"/" Cargo.lock

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
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
