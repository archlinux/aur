# Maintainer: methamphetaminelab <https://github.com/methamphetaminelab>

pkgname=gramtty
pkgver=1.2.0
pkgrel=1
_tdlibrs=1.4.0
_tdlib=1.8.61
pkgdesc='A terminal Telegram client (TDLib linked statically)'
arch=('x86_64')
url='https://github.com/methamphetaminelab/gramtty'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cargo' 'libc++' 'libc++abi')
# !lto: thorvg-sys builds C++ with makepkg CFLAGS, GCC LTO objects fail to link into the Rust binary
# !debug: the release profile already strips the binary
options=('!lto' '!debug')
optdepends=(
  'mpv: libmpv for playback inside the viewer, and the separate player (x)'
  'ffmpeg: video and sticker previews, upload thumbnails, voice encoding'
  'pipewire-audio: pw-record for voice messages, pw-play for notification sound'
  'opus-tools: opusenc for voice messages (alternative to ffmpeg)'
  'libnotify: desktop notifications (notify-send)'
  'libcanberra: notification sound (canberra-gtk-play, alternative to pw-play)'
  'wl-clipboard: clipboard copy and Ctrl+V paste on Wayland'
  'xdg-utils: opening files and links externally (xdg-open)'
  'kitty: recommended terminal for inline images (kitty graphics protocol)'
)
# Prebuilt static TDLib that tdlib-rs would otherwise download inside build().
# x86_64 only: tdlib-rs publishes it for linux-x86_64 and linux-aarch64.
source=("$pkgname-$pkgver.tar.gz::https://github.com/methamphetaminelab/gramtty/archive/refs/tags/v$pkgver.tar.gz"
        "tdlib-$_tdlib-linux-x86_64.zip::https://github.com/FedericoBruzzone/tdlib-rs/releases/download/v$_tdlibrs/tdlib-$_tdlib-linux-x86_64.zip")
sha256sums=('7455dd62b41243ac5ec624983237ce60f29ff792d324ad3fce166fe5a39647e7'
            '997069633f54306ada33776d2c4a530017d2e7325a22e0f12701d52438c37383')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LOCAL_TDLIB_PATH="$srcdir/tdlib"
  cargo build --frozen --release --no-default-features --features local-tdlib
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LOCAL_TDLIB_PATH="$srcdir/tdlib"
  # keep tests away from the real ~/.config and ~/.local/share
  export XDG_CONFIG_HOME="$srcdir/check/config" XDG_DATA_HOME="$srcdir/check/data"
  unset GRAMTTY_DATA_DIR
  cargo test --frozen --release --no-default-features --features local-tdlib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/gramtty -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md README.ru.md -t "$pkgdir/usr/share/doc/$pkgname"
}
