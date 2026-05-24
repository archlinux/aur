# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.5.2
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/Inlyne-Project/$pkgname"
license=(MIT)
depends=(fontconfig glibc libgcc freetype2 libxcursor libxi libxrandr oniguruma)
makedepends=(cargo libxcb libxkbcommon wayland)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('b9fca42df8b5b5120b8fe0945f9bb5433eabefe7719796f27ea71cb1fa426cb106d51db4e71020c837ed70a90e4632e84f902ba4f99dae714d93203f9f68a93a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target="$(rustc --print host-tuple)"
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
