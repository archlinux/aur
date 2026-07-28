# Maintainer: VisorCraft LLC <packages@visorcraft.com>

pkgname=arte-ogre
pkgver=1.8.1
pkgrel=1
pkgdesc='GPU-native, non-destructive image editor'
arch=('x86_64')
url='https://github.com/visorcraft/Arte-Ogre'
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'lcms2'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'arte-ogre.desktop'
)
sha256sums=(
  'd2002926d6f8d08b3d3d2f2c922cd7be6f90b42f0315f659ba7c11edf96a24da'
  'e31bb5f9f760ed48130d3a40b071858334cccdc207bb7bc06746e311d19e73f3'
)

prepare() {
  cd "Arte-Ogre-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Arte-Ogre-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR=target
  cargo build --package ogre --release --frozen
}

check() {
  cd "Arte-Ogre-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR=target
  cargo test --workspace --release --frozen
}

package() {
  cd "Arte-Ogre-$pkgver"

  install -Dm755 target/release/ogre "$pkgdir/usr/bin/arte-ogre"
  install -Dm644 "$srcdir/arte-ogre.desktop" \
    "$pkgdir/usr/share/applications/arte-ogre.desktop"
  install -Dm644 assets/ArteOgre.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/arte-ogre.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
