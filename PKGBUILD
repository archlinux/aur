# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: ftilde <ftilde at tamepointer dot tld for germany>

pkgname=handlr
pkgver=0.6.4
pkgrel=3
pkgdesc="Powerful alternative to xdg-utils written in Rust"
arch=('x86_64')
url="https://github.com/chmln/handlr"
license=('MIT')
depends=('shared-mime-info')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bash-completion.patch::$url/commit/0e62d1dfa34de844369667a387ba213fe2c1649c.patch")
sha512sums=('55779ad0c01e065678e1a57f338272f1d38057658fe6b7c54f7bc35595575aafe13aed6ca3d80cc65b912971aac9a2a6c78ac5512315af9f2d676a92c8c395ec'
            '904334cc85286fdfab8f394877d57f7bc8b2bda9a46f6d355b9f3f9ffa1b52a8da8524db5844c975212c4709774e4dfd3e1e75df78cb9eaadc6a32c5d0c101d2')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-bash-completion.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
}

# vim: ts=2 sw=2 et:
