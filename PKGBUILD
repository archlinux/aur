# Maintainer: Alessandro Pezzato <alessandro@pezzato.net>

pkgname=provola
pkgver=0.1.8
pkgrel=1
pkgdesc='A tool for quick development/test cycle in any language'
arch=(x86_64)
url='https://github.com/alepez/provola'
license=(APACHE MIT)
makedepends=(clang cmake git rust libxcb)
source=("git+$url#commit=dd7f67fe7dbef94c2a439453ec23000b102cddad")
b2sums=('SKIP')

build() {
  cargo build \
    --manifest-path "$srcdir/$pkgname/Cargo.toml" \
    --release
}

package() {
  install -Dm755 $pkgname/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Package licenses
  install -Dm644 $pkgname/LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 $pkgname/LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  cd $pkgname/target/release/build

  ../provola --shell-compl zsh > provola.zsh
  install -Dm644 provola.zsh "$pkgdir/usr/share/zsh/site-functions/_provola"

  ../provola --shell-compl fish > provola.fish
  install -Dm644 provola.fish "$pkgdir/usr/share/fish/vendor_completions.d/provola.fish"
}
