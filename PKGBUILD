# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww
pkgver=0.8.2
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/LGFae/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo' 'scdoc')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LGFae/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --target-dir ./target
  # manpages
  ./doc/gen.sh
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # manpages
  install -Dm644 ./doc/generated/*.1 -t "$pkgdir/usr/share/man/man1"
}
sha256sums=('6733cda771a0e635dbd00f7aef78ed60f1ccdf640647ecfe02d0cdfdef996b68')
