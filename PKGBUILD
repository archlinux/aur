# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: desbma

pkgname=zoxide
pkgver=0.8.0
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
sha512sums=('5f0bed68a391a28b7065ec7d50e5477547174f07e6e785817cb724b0bf59f174b84da2d4f22a9f49e06595a6570a2885f99ef7d0c08711a4ee46f5d3086cae96')
b2sums=('739f594bcbe916acc2c6ff076c86583621b296905641b5d197096399de8cb683fb8c82c06f9f3859e768a2247127fe1a190d0d379ba5f86d785cb6c211e7b6a4')

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
