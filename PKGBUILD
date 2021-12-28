# Maintainer: Alessandro Pezzato <alessandro@pezzato.net>

pkgname=provola
pkgver=0.1.8
pkgrel=3
pkgdesc='A tool for quick development/test cycle in any language'
arch=(x86_64)
url='https://github.com/alepez/provola'
license=(APACHE MIT)
makedepends=(clang cmake git rust libxcb)
source=("git+$url#commit=dd7f67fe7dbef94c2a439453ec23000b102cddad")
b2sums=('SKIP')

build() {
  cd provola
  RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo build \
    --release \
    --locked \
    --all-features \
    --target-dir=target
  ./target/release/provola --shell-compl bash > provola.bash
  ./target/release/provola --shell-compl fish > provola.fish
  ./target/release/provola --shell-compl zsh > provola.zsh
}

package() {
  cd provola

  strip target/release/$pkgname

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Package licenses
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  install -Dm644 provola.bash "$pkgdir/usr/share/bash-completion/completions/provola"
  install -Dm644 provola.fish "$pkgdir/usr/share/fish/completions/provola.fish"
  install -Dm644 provola.zsh "$pkgdir/usr/share/zsh/site-functions/_provola"
}
