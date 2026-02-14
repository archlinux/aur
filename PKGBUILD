# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: desbma

pkgname=zoxide
pkgver=0.9.9
pkgrel=2
pkgdesc='A smarter cd command for your terminal'
arch=('x86_64')
url='https://github.com/ajeetdsouza/zoxide'
license=('MIT')
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo git)
optdepends=('fzf: for interactive selection')
options=('!lto')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('a43bd37528b841bdf160a8b3d5f72afd5ba5b1caa22948d5b33097012d1cf9c2')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1/" man/man1/*.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md

  # shell auto-completions
  cd contrib/completions
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions/" _zoxide
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" zoxide.fish
  install -vDm644 -t "$pkgdir/usr/share/nushell/vendor/autoload/" zoxide.nu
  install -vDm644 zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
}
