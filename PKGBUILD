# Maintainer: Дмитрий Шафранов <d.shafranov@kpda.ru>

pkgname=ide-native
pkgver=0.1.0
pkgrel=1
pkgdesc='struIDEl native UI (egui) for live-coding patterns'
arch=('x86_64' 'aarch64')
license=('LicenseRef-Unknown')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'mesa'
)
makedepends=(
  'cargo'
  'pkgconf'
)
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz"
  "$pkgname.desktop"
)
b2sums=(
  '142e3338e5d7c4248f478c66946ae1833af2045748cd8d7e94cc4a94883737d11cea2fa104cabcce518e30f51b65873de665928e56394aa59d0e94f13247e13b'
  '15c0fe42ee52b1576fda8a54f2301c0b72d6b7d57325f8fb0734c1b24667cfbf5eec0fbc51dc0794894c51a89dd4695510b89f6592efaf9bbefa2d4691e8c46d'
)

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
