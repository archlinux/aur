# Maintainer: adelmonte
pkgname=langis-gui
pkgver=0.1.0
pkgrel=1
_langisver=0.1.0
pkgdesc='A native Signal desktop client for Linux on the langis library, drawn with egui (unofficial)'
arch=('x86_64')
url='https://github.com/adelmonte/langis-gui'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libpulse' 'libpipewire' 'pipewire-audio' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('cargo' 'protobuf' 'clang' 'cmake')
optdepends=('noto-fonts-emoji: color emoji'
            'hunspell-en_us: spell check (or another hunspell dictionary)'
            'xdg-desktop-portal: screen sharing')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "langis-$_langisver.tar.gz::https://github.com/adelmonte/langis/archive/v$_langisver.tar.gz")
sha256sums=('041ffed30ffa71281e79b38c4066ab25d6409933e0e72ca054d9c303e2b76ac5'
            '5d163a2abc5cf5baeda2e3b56c9ade28d067cf0ae1864a0d762e4107c467aee2')

prepare() {
  # langis-gui builds against langis checked out next to it (../langis).
  ln -sfn "langis-$_langisver" langis
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The build downloads Signal's prebuilt WebRTC (about 28 MB) into target/webrtc.
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/langis-gui "$pkgdir/usr/bin/langis-gui"
  install -Dm644 data/langis.desktop "$pkgdir/usr/share/applications/langis.desktop"
  install -Dm644 data/org.langis.policy "$pkgdir/usr/share/polkit-1/actions/org.langis.policy"
  install -Dm644 assets/app/langis.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/langis.svg"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/app/langis-$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/langis.png"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
