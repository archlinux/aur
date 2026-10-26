# Maintainer: Marcel Krause <feuerwinter@gmail.com>

pkgname=eve-wrench-git
pkgver=0.6.0.r0.g2de3d80
pkgrel=1
pkgdesc='EVE Online settings manager - backup, restore, and sync settings (development version)'
arch=('x86_64')
url='https://github.com/eve-wrench/eve-wrench-app'
license=('MIT')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'libx11'
  'openssl'
  'wayland'
  'zstd'
)
optdepends=('vulkan-driver: GPU-accelerated rendering')
provides=("eve-wrench=${pkgver}")
conflicts=('eve-wrench')
# Cargo's release profile already enables thin LTO; makepkg's linker-plugin LTO
# drops native objects from mixed Rust/C crates such as ring and wayland-backend.
options=('!debug' '!lto')
source=('git+https://github.com/eve-wrench/eve-wrench-app.git')
b2sums=('SKIP')

pkgver() {
  cd eve-wrench-app
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd eve-wrench-app
  cargo fetch --locked
}

build() {
  cd eve-wrench-app
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgbase}"
  cargo build --frozen --release -p eve-wrench
}

package() {
  cd eve-wrench-app

  install -Dm755 target/release/eve-wrench "${pkgdir}/usr/bin/eve-wrench"
  install -Dm644 packaging/linux/eve-wrench.desktop \
    "${pkgdir}/usr/share/applications/eve-wrench.desktop"
  install -Dm644 assets/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eve-wrench.png"
  install -Dm644 assets/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eve-wrench.png"
  install -Dm644 assets/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/eve-wrench.png"
  install -Dm644 assets/icons/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eve-wrench.svg"
}
