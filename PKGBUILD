# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154,2164
# shellcheck shell=bash

pkgname=charasay
pkgver=3.3.0
pkgrel=2
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("any")
url="https://github.com/latipun7/charasay"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2ebd4943abe8c8d39486ca99c354c5113380a9dffe4a3b3c2530c65011c7bd8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --locked --release

  # generate completions
  ./target/release/chara completions --shell zsh >"$srcdir/$pkgname-$pkgver/target/_chara"
  ./target/release/chara completions --shell bash >"$srcdir/$pkgname-$pkgver/target/chara.bash"
  ./target/release/chara completions --shell fish >"$srcdir/$pkgname-$pkgver/target/chara.fish"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/chara "${pkgdir}/usr/bin/chara"

  install -Dm644 target/_chara "${pkgdir}/usr/share/zsh/site-functions/_chara"
  install -Dm644 target/chara.bash "${pkgdir}/usr/share/bash-completion/completions/chara.bash"
  install -Dm644 target/chara.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chara.fish"
}
