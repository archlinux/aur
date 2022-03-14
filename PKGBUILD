# Maintainer: MedzikUser <nivua1fn@duck.com>
_repo='MedzikUser/imgurs'
_ver=v0.6.0

pkgname='imgurs'
pkgver=0.6.0
pkgrel=1
pkgdesc='CLI for Imgur API written in Rust'
arch=('x86_64')
url="https://github.com/$_repo"
license=('BSD3')

makedepends=('cargo')
optdepends=(
  'libnotify: Notification support'
  'xsel: Clipboard support'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_ver.tar.gz")
sha512sums=('51ea57145c8a2d316c686c351d8842ea186430a190bd70aaec244db76127a9244522463bfcbf235ea4e2104c68a1e69d3a7d5c467a5c850625402aa2334c9f7c')

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
