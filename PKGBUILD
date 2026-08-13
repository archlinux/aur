# Maintainer: Juniper <trixelit.alias@gmail.com>

pkgname=rox-player
pkgver=1.17.0
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
makedepends=('cargo' 'patch' 'curl' 'gcc' 'clang')
optdepends=(
  'vulkan-intel: Vulkan support for Intel graphics'
  'vulkan-radeon: Vulkan support for AMD graphics'
  'nvidia-utils: Vulkan support for Nvidia graphics'
)
provides=('rox')
conflicts=('rox-player-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9269606fa44f48c323172d5cdeca0a146cdc2d857669d07ddad501cf8a9b3425')

prepare() {
  cd "rox-$pkgver"
  
  # Fetch and patch the GPUI crates for rox
  chmod +x scripts/vendor-gpui.sh
  ./scripts/vendor-gpui.sh

  # Download rust deps
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rox-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"

  # AUR build API keys from Upstream
  export LASTFM_API_KEY=186d4bf7bd5d686fedb15dc27f33b954
  export LASTFM_API_SECRET=56addddfc3e50143c90152568ce9185f
  export DISCORD_APPLICATION_ID=1531533372051030036

  # Tell ring and sqlite3-sys to link against system libraries / build C code correctly
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

  # Fix ring's C/Assembly compilation
  export CC=gcc
  export CFLAGS="-O2 -fPIC"
  export RING_PREGEN_PREFIX=1

  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"

  cargo build --offline --release --all-targets
}

package() {
  cd "rox-$pkgver"
  
  # Install binary
  install -Dm755 "target/release/rox" "$pkgdir/usr/bin/rox"

  # Install Licence
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Desktop entry & app icon
  install -Dm644 "crates/rox/assets/app/rox.desktop" "$pkgdir/usr/share/applications/rox.desktop"
  
  install -Dm644 "crates/rox/assets/app/rox.png" "$pkgdir/usr/share/pixmaps/rox.png"
}
