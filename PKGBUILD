# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=vimg
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for video images. Generate animated video contact sheets fast."
arch=('x86_64')
url="https://github.com/alexheretic/vimg"
license=('MIT')
depends=('ffmpeg')
optdepends=()
makedepends=('cargo'
             'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5582953b6321ee1c4c350e8759e4fd0e2d89d4a879e54925a9b0f0042f9c6e0f')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked
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
