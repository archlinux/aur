# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gpg-tui
pkgver=0.1.2
pkgrel=1
pkgdesc="A terminal user interface for GnuPG"
arch=('x86_64')
url="https://github.com/orhun/gpg-tui"
license=('MIT')
depends=('libx11' 'gpgme')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3412bc10c8a5777d160f1f6a9d68c9184285b02df7c81a40956ef865ccd093e3c942896bf8fe507fbaeb89aba97afa27a424637b67a71654bd6f6b383073088c')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir completions/
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
  OUT_DIR=completions/ cargo run --release --bin completions
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
  install -Dm 644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
}
