# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cmplayer
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal-based music player with spectrum visualizer, lyrics support, and MPRIS integration."
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/cli-music-player"
license=('AGPL3')
depends=('alsa-lib' 'dbus' 'chromaprint' 'fftw')
makedepends=('cargo' 'cmake' 'pkg-config')
provides=("cmplayer")
conflicts=("cmplayer")
options=(!lto)
source=("https://github.com/professor-lee/cli-music-player/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "cli-music-player-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "cli-music-player-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "cli-music-player-${pkgver}"
  install -Dm755 "target/release/cmplayer" "$pkgdir/usr/bin/cmplayer"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Copy default config and themes if present
  if [ -d "config" ]; then
    install -Dm644 config/default.toml "$pkgdir/usr/share/cmplayer/config/default.toml"
  fi
  if [ -d "themes" ]; then
    find themes -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/cmplayer/{}" \;
  fi
}
