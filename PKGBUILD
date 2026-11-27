# Maintainer: shenjiangqiu <https://github.com/shenjiangqiu>
pkgname=gpcal
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple calculator built with GPUI"
url="https://github.com/shenjiangqiu/gpcal"
arch=('x86_64')
license=('MIT')
depends=(
  'fontconfig'
  'freetype2'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
)
makedepends=('cargo' 'pkgconf')
install=gpcal.install
# makepkg's default LTO adds -flto to CFLAGS. GCC then emits slim LTO
# objects for wayland-backend's C shim, which rust-lld cannot link.
# The debug package would be empty because release builds carry no debug info.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d7e69b0c774c5bb5aa278f3ca9c820e3414a50738b9dcf05c43981a930f2c1b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Keep the temporary build path out of panic messages and other strings.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=$pkgname-$pkgver"
  cargo build --release --locked --offline
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 assets/gpcal.desktop \
    "$pkgdir/usr/share/applications/gpcal.desktop"
  install -Dm644 assets/gpcal.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/gpcal.svg"

  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "assets/icons/${size}x${size}/gpcal.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/gpcal.png"
  done

  install -Dm644 assets/icons/256x256/gpcal.png \
    "$pkgdir/usr/share/pixmaps/gpcal.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
