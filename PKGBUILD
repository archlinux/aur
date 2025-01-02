# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.9.1
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
             'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d1821b77ee0df1e2026c24683fc02e3bd103af0cfcaef2be6a429b9aa9d7f74c')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked
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
