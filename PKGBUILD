# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=tmplayer
pkgver=0.2.2
pkgrel=1
pkgdesc="A terminal-based music player with spectrum visualizer, lyrics support, and MPRIS integration."
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/TMPlayer.git"
license=('AGPL3')
depends=('alsa-lib' 'dbus' 'chromaprint' 'fftw')
optdepends=(
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
makedepends=('cargo' 'cmake' 'pkg-config')
provides=("tmplayer")
conflicts=("tmplayer")
options=(!lto)
source=("https://github.com/professor-lee/TMPlayer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "TMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "TMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "TMPlayer-${pkgver}"
  install -Dm755 "target/release/tmplayer" "$pkgdir/usr/bin/tmplayer"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Copy default config and themes if present
  if [ -d "config" ]; then
    install -Dm644 config/default.toml "$pkgdir/usr/share/tmplayer/config/default.toml"
  fi
  if [ -d "themes" ]; then
    find themes -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/tmplayer/{}" \;
  fi
}
