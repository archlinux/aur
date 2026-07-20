# Maintainer: Дмитрий Шафранов <d.shafranov@kpda.ru>

pkgname=struidel
pkgver=0.1.0
pkgrel=1
pkgdesc='struIDEl — native Strudel IDE (egui)'
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
_srcname=ide-native
source=(
  "$_srcname-$pkgver.tar.gz"
  "$pkgname.desktop"
)
b2sums=(
  '142e3338e5d7c4248f478c66946ae1833af2045748cd8d7e94cc4a94883737d11cea2fa104cabcce518e30f51b65873de665928e56394aa59d0e94f13247e13b'
  '0bfc0aa9e113759634b0df22301f6250f7057a3be0259b3bc2e7353726472d676cfcde9803789004e3509a123c48f8910a93d215e0c8fb90d3b6a6118a52f031'
)

prepare() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_srcname"
  install -Dm755 "target/release/$_srcname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
