# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=gtw
pkgver=0.2.4
pkgrel=1
pkgdesc='Wikipedia in your terminal: cached reading, rich rendering, inline media, and offline lists'
arch=('x86_64' 'aarch64')
url='https://github.com/craftty-org/gtw'
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'clang' 'cmake' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` to fill this in before building/publishing.
sha256sums=('e6c1a93d837b8dad09d02458e10a5f5954873591323fb89015b817afa660ccc1')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # Man page and shell completions are generated from the CLI definition.
  mkdir -p artifacts
  ./target/release/gtw --man >artifacts/gtw.1
  ./target/release/gtw --completions bash >artifacts/gtw.bash
  ./target/release/gtw --completions zsh >artifacts/_gtw
  ./target/release/gtw --completions fish >artifacts/gtw.fish
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/gtw "$pkgdir/usr/bin/gtw"
  install -Dm644 artifacts/gtw.1 "$pkgdir/usr/share/man/man1/gtw.1"
  install -Dm644 artifacts/gtw.bash "$pkgdir/usr/share/bash-completion/completions/gtw"
  install -Dm644 artifacts/_gtw "$pkgdir/usr/share/zsh/site-functions/_gtw"
  install -Dm644 artifacts/gtw.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtw.fish"
}
