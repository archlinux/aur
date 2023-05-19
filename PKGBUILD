# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=vimg
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI for video images. Generate animated video contact sheets fast."
arch=('x86_64')
url="https://github.com/alexheretic/vimg"
license=('MIT')
depends=('ffmpeg')
optdepends=()
makedepends=('cargo'
             'git'
             'lld')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0e6c39c69b88121b7bc463a087bc5ca5b1054a4ff6fb12da96dc61d6e413ebe1')

build() {
  cd "$pkgname-$pkgver"
  RUSTFLAGS='-C link-arg=-fuse-ld=lld' \
    RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  local bin
  bin=${CARGO_TARGET_DIR:-"$pkgname-$pkgver/target"}/release/vimg

  # generate completions
  "$bin" print-completions "bash" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/bash-completion/completions/vimg"
  "$bin" print-completions "fish" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/fish/completions/vimg.fish"
  "$bin" print-completions "zsh" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/zsh/site-functions/_vimg"

  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
}
