# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zola
pkgver=0.22.0
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
depends=('gcc-libs')
makedepends=('cargo')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('75274ca54c97da2f24645568e2c7024f6661ce002e8f7e09d6cd30bae7b73b0a')

prepare() {
  cd zola-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd zola-$pkgver
  CFLAGS+=' -ffat-lto-objects'
  cargo build --frozen --release
}

check() {
  cd zola-$pkgver
  cargo test --frozen
}

package() {
  cd zola-$pkgver
  local _target="target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" $_target
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  $_target completion bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  $_target completion fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  $_target completion zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# vim:set ts=2 sw=2 et:
