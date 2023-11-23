# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.3.2
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('80ebaa8e9f1b5a415a1fb904d9eede43ba643e36359f4be3b4d71cc053916a5a9b491a86cbe78e0c0ee768ef30afe2682706cce98c0beb1f8dd9daa6a74a0f19')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Generate and install completions
  "target/release/$pkgname" --gen-completions bash > bash
  "target/release/$pkgname" --gen-completions fish > fish
  "target/release/$pkgname" --gen-completions zsh  > zsh
  install -Dm644 bash "${pkgdir}/usr/share/bash-completion/completions/inlyne.bash"
  install -Dm644 fish "${pkgdir}/usr/share/fish/vendor_completions.d/inlyne.fish"
  install -Dm644 zsh  "${pkgdir}/usr/share/zsh/site-functions/_inlyne"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
