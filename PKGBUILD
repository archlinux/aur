# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=4.8.0
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('custom:WTFPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d024cc4145da69964b35972e211dab49f59107a3564824921da674df1ab8aa9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
  mkdir -p completions
  target/release/$pkgname --generate-completions bash > completions/$pkgname
  target/release/$pkgname --generate-completions zsh > completions/_$pkgname
  target/release/$pkgname --generate-completions fish > completions/$pkgname.fish
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 completions/$pkgname "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -D -m644 completions/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -D -m644 completions/$pkgname.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
