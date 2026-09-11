# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.telegram-rs

pkgname=telegram-rs
pkgver=0.12.0
pkgrel=1
pkgdesc="Feather-light Telegram desktop client in Rust - real-time push, GPU rendering"
arch=('x86_64')
url="https://github.com/MrChausson/telegram-rs"
license=('MIT')
makedepends=('cargo' 'git' 'cmake')
depends=('gcc-libs' 'alsa-lib')
optdepends=('ffmpeg: voice-note playback (Opus -> WAV transcode)'
            'wl-clipboard: paste images from the clipboard on Wayland (Ctrl+V)')
conflicts=('telegram-rs-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrChausson/telegram-rs/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('8eeaf6c541adda6229f63ad359636f41d30b7c84dcf4b4b519483fdbb94913a6'
            'ffa18dbe3094420d7feb0997bc43496100a43ae1277de38984a767c085b57d34'
            '29a54866c7f634ce95caffa7e76c95d69101dccb3f2fc3ffa7a1eecd0c9b2d04')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/telegram-rs "${pkgdir}/usr/bin/telegram-rs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
