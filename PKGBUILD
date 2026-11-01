# Maintainer: Nolan Tran <ttrannol000@gmail.com>

pkgname=crest-player-git
pkgver=0.1.0.r83.g11ab314
pkgrel=1
pkgdesc='Terminal music player with YouTube streaming, synchronized lyrics, and ASCII video'
arch=('x86_64')
url='https://github.com/ArvalCode/crest-player'
license=('MIT')
depends=('brotli' 'ffmpeg' 'gcc-libs' 'glibc' 'openssl' 'yt-dlp' 'zlib' 'zstd')
makedepends=('cargo' 'git' 'pkgconf')
provides=('crest-player')
conflicts=('crest-player')
source=('crest-player::git+https://github.com/ArvalCode/crest-player.git')
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/crest-player"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/crest-player"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/crest-player"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/crest-player"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
}

package() {
  cd "$srcdir/crest-player"
  install -Dm0755 target/release/crest-player "$pkgdir/usr/bin/crest-player"
  install -Dm0755 packaging/linux/crest-player-launch \
    "$pkgdir/usr/bin/crest-player-launch"
  install -Dm0644 packaging/linux/io.github.ArvalCode.CrestPlayer.desktop \
    "$pkgdir/usr/share/applications/io.github.ArvalCode.CrestPlayer.desktop"
  install -Dm0644 packaging/linux/icons/io.github.ArvalCode.CrestPlayer-512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.ArvalCode.CrestPlayer.png"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/crest-player/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/crest-player/README.md"
}
