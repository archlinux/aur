# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.4.3
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/Inlyne-Project/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma)
makedepends=(cargo libxcb libxkbcommon wayland)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('eebec3813a17e1afdba71bfd6818d0696d7ee65a1c7455c84d409b0cd91d18178480b8868b99176c531c043846b2d5af7ed3772f5227774bc18c089f98a29682')

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

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
