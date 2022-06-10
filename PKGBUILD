# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.3.2
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
sha256sums=('a80ed8ede7ca5d3989b8e035086c114c12d6c15bd5bdfc2338d4a88f832950c3')

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
