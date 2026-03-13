# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cmplayer
pkgver=0.1.0.r0.g1234567
pkgrel=1
pkgdesc="A terminal-based music player with spectrum visualizer, lyrics support, and MPRIS integration."
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/cli-music-player"
license=('AGPL3')
depends=('alsa-lib' 'dbus' 'chromaprint' 'fftw')
makedepends=('cargo' 'git' 'cmake' 'pkg-config')
provides=("cmplayer")
conflicts=("cmplayer")
source=("${pkgname}::git+https://github.com/professor-lee/cli-music-player.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
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
