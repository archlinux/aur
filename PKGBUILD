# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.5.0
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/Inlyne-Project/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma)
makedepends=(cargo libxcb libxkbcommon wayland)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('57968cf496281de1f1f0d2353d282a502d2fd23c8e3ea7b54241686dfcf5392fc8cb48f2c98c5a31519b1ee05b4cae27654f25af29112829892520473662f325')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTONIG_SYSTEM_LIBONIG=yes cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTONIG_SYSTEM_LIBONIG=yes cargo test --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Generate and install completions
  install -Dm644 "completions/inlyne.bash" "${pkgdir}/usr/share/bash-completion/completions/inlyne.bash"
  install -Dm644 "completions/inlyne.elv" "${pkgdir}/usr/share/elvish/lib/inlyne.elv"
  install -Dm644 "completions/inlyne.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/inlyne.fish"
  install -Dm644 "completions/_inlyne"  "${pkgdir}/usr/share/zsh/site-functions/_inlyne"

  install -Dm644 "assets/inlyne.desktop" "$pkgdir/usr/share/applications/inlyne.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
