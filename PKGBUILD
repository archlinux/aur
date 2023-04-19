# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww
pkgver=0.7.3
pkgrel=0
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo' 'scdoc')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release 
  # manpages
  ./doc/gen.sh
  for page in $(ls ./doc/generated/*.1)
  do 
    gzip -f "$page"
  done
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
  cd ./doc/generated 
  for page in $(ls *.1.gz)
  do 
    install -Dm644 "$page" "$pkgdir/usr/share/man/man1/$page"
  done
}
sha256sums=('874897cb318d5cf269bd8f5915332cc2a76abcfda233cc17924ae4c533499fe7')
