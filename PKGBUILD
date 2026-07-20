# Maintainer: Дмитрий Шафранов <d.shafranov@kpda.ru>

pkgname=struidel
pkgver=0.1.0
pkgrel=2
pkgdesc='struIDEl — native Strudel IDE (egui) with JS runtime'
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later' 'LicenseRef-Unknown')
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
  'nodejs'
)
makedepends=(
  'cargo'
  'npm'
  'pkgconf'
)
options=('!lto')
_srcname=ide-native
_runtime=struidel-runtime
source=(
  "$_srcname-$pkgver.tar.gz"
  "$_runtime-$pkgver.tar.gz"
  "$pkgname.desktop"
)
b2sums=('234c74348a0e5d942dffbd309bafc157b597110bb996904d402715176c6889b62c6c0bb03bc17434caf8650cfa2042231706099d773dff2d400bfaf9947c6f90' '33969a405d981b71cced70d89a3fbdb2bb2429a0fb0b7da2429b814956a162e759305d52f9ee1b8e422a91d5bd41caa6edd78e2081bc137d47e68dbe5333fcef' '0bfc0aa9e113759634b0df22301f6250f7057a3be0259b3bc2e7353726472d676cfcde9803789004e3509a123c48f8910a93d215e0c8fb90d3b6a6118a52f031')

prepare() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/$_runtime"
  npm install --omit=dev --no-fund --no-audit
  mkdir -p node_modules/@strudel
  ln -sfn ../../packages/core node_modules/@strudel/core
  ln -sfn ../../packages/mini node_modules/@strudel/mini
  ln -sfn ../../packages/tonal node_modules/@strudel/tonal
  ln -sfn ../../packages/transpiler node_modules/@strudel/transpiler
  ln -sfn ../../packages/superdough node_modules/@strudel/superdough
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

  install -d "$pkgdir/usr/share/struidel"
  cp -a "$srcdir/$_runtime" "$pkgdir/usr/share/struidel/strudel"

  if [ -d visual-stage ]; then
    cp -a visual-stage "$pkgdir/usr/share/struidel/visual-stage"
  fi

  if [ -f "$pkgdir/usr/share/struidel/strudel/LICENSE" ]; then
    install -Dm644 "$pkgdir/usr/share/struidel/strudel/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/strudel-LICENSE"
  fi
}
