# Maintainer: MrRedstonia <contact@mrredstonia.com>
# Builds EasyBoard from source against the system Qt.
pkgname=easyboard-app
pkgver=0.3.1
pkgrel=1
pkgdesc='Cross-platform soundboard with a virtual microphone input (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/MrRedstonia/EasyBoard'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'libpulse' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'lld')
optdepends=('ffmpeg: save sounds as MP3, OGG, FLAC, Opus or M4A'
            'pipewire-pulse: virtual microphone inputs on PipeWire systems'
            'qt6-imageformats: WebP pictures'
            'kimageformats: AVIF and HEIC pictures')
provides=('easyboard-app')
# the other package called "easyboard" also installs /usr/bin/easyboard
conflicts=('easyboard' 'easyboard-app-bin')
# makepkg's LTO makes GCC objects that LLD (which cxx-qt links with) can't read
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e63903f905c20275eab6728d2daf70397e839b13b034130bc013cc1b8e06871')

prepare() {
  cd "EasyBoard-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "EasyBoard-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export QMAKE=/usr/bin/qmake6
  cargo build --frozen --release
}

package() {
  cd "EasyBoard-$pkgver"
  install -Dm755 target/release/easyboard "$pkgdir/usr/bin/easyboard"
  install -Dm644 packaging/easyboard.desktop "$pkgdir/usr/share/applications/easyboard.desktop"
  install -Dm644 assets/app_icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/easyboard.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY.md"
}
