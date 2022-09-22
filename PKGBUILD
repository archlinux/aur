# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='imgurs'
pkgver="0.9.1"
pkgrel=1
pkgdesc='CLI for a Imgur API written in Rust'
arch=('x86_64')
url="https://github.com/MedzikUser/imgurs"
license=('BSD3')
makedepends=('cargo')
optdepends=('libnotify: Notification support'
            'xsel: Clipboard support'
            'xclip: Clipboard support')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1cb83bbfdbe957cd5b5924425861aad1a614bdf36ee2d2646a86b7e23e441571')

build() {
  cd "${pkgname}-${pkgver}/imgurs-cli"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  target/release/$pkgname completions bash > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  target/release/$pkgname completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  target/release/$pkgname completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish

  mkdir -p "$pkgdir/usr/share/man/man1"
  target/release/$pkgname manpage | gzip > "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
