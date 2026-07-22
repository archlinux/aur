pkgname=cpcat
pkgver=0.1.1 # Match your GitHub release tag (without the 'v')
pkgrel=1
pkgdesc="A lightweight utility that copies file contents directly to the clipboard"
arch=('x86_64')
url="https://github.com/danielandastro/cpcat"
license=('MIT') # Update this if you used a different license
depends=('gcc-libs')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/danielandastro/cpcat/tar.gz/refs/tags/$pkgver")
sha256sums=('6cb846ef203a6943b7a1c7f0d6b28419c5f1a1d01545042d993d34cd3818901d')
prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  
  # Uncomment these if you want to include your README and License
  # install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
