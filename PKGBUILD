# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.5.1
pkgrel=1
pkgdesc="AV1 encoding tool with fast VMAF sampling."
arch=('x86_64')
url="https://github.com/alexheretic/ab-av1"
license=('MIT')
depends=('svt-av1'
         'ffmpeg'
         'vmaf')
optdepends=()
makedepends=('cargo'
             'git'
             'lld')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f9184130075020863c8c872bc6ecbe2430317efc6169ebf021b774f3ad04b10f')

build() {
  cd "$pkgname-$pkgver"
  RUSTFLAGS='-C link-arg=-fuse-ld=lld' \
    RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  local bin
  bin=${CARGO_TARGET_DIR:-"$pkgname-$pkgver/target"}/release/ab-av1

  # generate completions
  "$bin" print-completions "bash" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/bash-completion/completions/ab-av1"
  "$bin" print-completions "fish" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/fish/completions/ab-av1.fish"
  "$bin" print-completions "zsh" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/zsh/site-functions/_ab-av1"

  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
}
