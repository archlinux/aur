# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.4.3
pkgrel=1
pkgdesc="AV1 encoding tool with fast VMAF sampling."
arch=('x86_64')
url="https://github.com/alexheretic/ab-av1"
license=('MIT')
depends=('svt-av1'
         'ffmpeg'
         'vmaf'
         'opus')
optdepends=()
makedepends=('cargo'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c4b6304509e2a895ce9aca0187e076e3aad7f56f5301a1ba8fd0f66da4e8f32e')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --target-dir=target
}

package() {
  local bin
  bin="$pkgname-$pkgver"/target/release/ab-av1

  # generate completions
  "$bin" print-completions "bash" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/bash-completion/completions/ab-av1"
  "$bin" print-completions "fish" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/fish/completions/ab-av1.fish"
  "$bin" print-completions "zsh" > out.txt
  install -Dm644 out.txt "$pkgdir/usr/share/zsh/site-functions/_ab-av1"

  install -Dm755 "$bin" -t "$pkgdir/usr/bin"
}
