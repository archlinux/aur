# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=charasay
pkgver=1.0.0
pkgrel=1
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18ac4c9f9a710be107ff1398288c9f8b9970727941d819950a435e85a272b1c9')

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  cargo build --locked --release

  # generate completions
  ./target/release/chara completions --shell zsh >"$srcdir/$pkgname-$pkgver/target/_chara"
  ./target/release/chara completions --shell bash >"$srcdir/$pkgname-$pkgver/target/chara.bash"
  ./target/release/chara completions --shell fish >"$srcdir/$pkgname-$pkgver/target/chara.fish"
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  install -Dm755 target/release/chara "${pkgdir}/usr/bin/chara"

  install -Dm644 target/_chara "${pkgdir}/usr/share/zsh/site-functions/_chara"
  install -Dm644 target/chara.bash "${pkgdir}/usr/share/bash-completion/completions/chara.bash"
  install -Dm644 target/chara.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chara.fish"
}
