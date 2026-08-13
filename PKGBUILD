# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support."
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL3')
depends=('alsa-lib' 'dbus' 'chromaprint' 'fftw' 'cava' 'chafa')
optdepends=(
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
makedepends=('cargo' 'cmake' 'pkgconf' 'git')
options=(!lto)
source=("https://github.com/professor-lee/CNMPlayer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "CNMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo generate-lockfile
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "CNMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "CNMPlayer-${pkgver}"
  install -Dm755 "target/release/cnmplayer" "$pkgdir/usr/bin/cnmplayer"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Copy default config and themes if present
  if [ -d "config" ]; then
    install -Dm644 config/default.toml "$pkgdir/usr/share/cnmplayer/config/default.toml"
  fi
  if [ -d "themes" ]; then
    find themes -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/cnmplayer/{}" \;
  fi
}

