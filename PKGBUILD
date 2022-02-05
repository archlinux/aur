# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=ab-av1
pkgver=0.1.1
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
makedepends=('rust'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6fe561789476028fd43f6d29600019fe5075c4546f0ee75c1d7bdf6d27ca24f1')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --target-dir=target
}

package() {
  local bin
  bin="$pkgname-$pkgver"/target/release/ab-av1

  # generate completions
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  "$bin" print-completions bash > "$pkgdir/usr/share/bash-completion/completions/ab-av1"
  mkdir -p "$pkgdir/usr/share/share/fish/completions"
  "$bin" print-completions fish > "$pkgdir/usr/share/share/fish/completions/ab-av1.fish"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  "$bin" print-completions zsh > "$pkgdir/usr/share/zsh/site-functions/_ab-av1"

  install -Dm 755 "$bin" -t "$pkgdir/usr/bin"
}
