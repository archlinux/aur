# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: desbma

pkgname=zoxide
pkgver=0.7.6
pkgrel=1
pkgdesc="A smarter cd command for your terminal"
arch=('x86_64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=(
  'fzf: for interactive selection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('818719b639f89f7f98b67f99aff08be16ef5a425505a2cb28c755f8e3ce2823ed49d9687d346ba80a2a9c86169c9de18481cdac319122a57b3f89acef05abecc')
b2sums=('3bbd79c1c81f8f6cb8fc2ad34e9a3ac372a960ae0bdf4b2fb53916a86c2422bc65ae974d36bdb83fff5cf102b0a2a4ef43fbf70fdc5bb86cb6468eb0b6c31b4c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/*.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # shell auto-completions
  cd contrib/completions
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions" _zoxide
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" zoxide.fish
  install -vDm644 zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
}
