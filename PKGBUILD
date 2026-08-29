# Maintainer: Juniper <trixelit.alias@gmail.com>

pkgname=rox-player-git
pkgver=1.23.5.r0.g783b238
pkgrel=1
pkgdesc="Fast, composable music player written in rust (foobar2000 for the current year)"
arch=('x86_64')
url="https://github.com/zealsprince/rox"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'glibc'
  'gcc-libs'
  'sqlite'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
)
makedepends=('cargo' 'patch' 'curl' 'gcc' 'clang' 'git')
optdepends=(
  'vulkan-intel: Vulkan support for Intel graphics'
  'vulkan-radeon: Vulkan support for AMD graphics'
  'nvidia-utils: Vulkan support for Nvidia graphics'
)
provides=('rox' 'rox-player')
conflicts=('rox-player')
source=("rox::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "rox"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "rox"
  
  # Fetch and patch the GPUI crates for rox
  chmod +x scripts/vendor-gpui.sh
  ./scripts/vendor-gpui.sh

  # Download rust deps
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rox"
  export CARGO_HOME="$srcdir/cargo-home"

  # Tell ring and sqlite3-sys to link against system libraries / build C code correctly
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

  # Fix ring's C/Assembly compilation
  export CC=gcc
  export CFLAGS="-O2 -fPIC"
  export RING_PREGEN_PREFIX=1

  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"

  cargo build --frozen --release --package rox --package rox-mcp
}

package() {
  cd "rox"
  
  # Install binary
  install -Dm755 "target/release/rox" "$pkgdir/usr/bin/rox"
  install -Dm755 "target/release/rox-mcp" "$pkgdir/usr/bin/rox-mcp"

  # Install Licence
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Desktop entry & app icon
  install -Dm644 "crates/rox/assets/app/rox.desktop" "$pkgdir/usr/share/applications/rox.desktop"

  install -Dm644 "crates/rox/assets/app/rox.png" "$pkgdir/usr/share/pixmaps/rox.png"
}
