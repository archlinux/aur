# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='imgurs'
pkgver=0.7.2
pkgrel=1
pkgdesc='CLI for Imgur API written in Rust'
arch=('x86_64')
url="https://github.com/MedzikUser/imgurs"
license=('BSD3')

makedepends=('rust')
optdepends=('libnotify: Notification support'
            'xsel: Clipboard support'
            'xclip: Clipboard support')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2fc01e6c04533caf02b01f216b7698527fc33a255f334e701bf462303694730f8ee15f61871a440e5a024e05ad9c3ac51bc7601371a2de7eed26140e47b550dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  target/release/$pkgname completions bash > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  target/release/$pkgname completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  target/release/$pkgname completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish

  mkdir -p "$pkgdir/usr/share/man/man1"
  target/release/$pkgname manpage | gzip > "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
