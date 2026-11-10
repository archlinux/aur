# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=easyshot
_repo=mah3uz/easyshot
pkgver=0.1.0
pkgrel=1
pkgdesc='Screenshot, annotation and screen-recording app for Linux/Wayland'
install=easyshot.install
arch=('x86_64')
url="https://easyshot.site"
license=('MIT')
depends=(
  'glibc' 'gcc-libs' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb'
  'vulkan-icd-loader' 'fontconfig' 'freetype2' 'dbus' 'alsa-lib' 'hicolor-icon-theme'
  'gstreamer' 'gst-plugins-base-libs'
)
makedepends=('rustup')
optdepends=(
  'gpu-screen-recorder: fastest screen recording'
  'wf-recorder: screen recording on wlroots compositors'
  'ffmpeg: video export and trimming'
  'tesseract: text capture (OCR) and smart redaction'
  'tesseract-data-eng: English text recognition'
  'xdg-desktop-portal: screen-cast recording and file dialogs'
)
provides=('easyshot')
conflicts=('easyshot-bin')
options=('!lto' '!strip' '!debug')
source=("$pkgname-$pkgver.tar.zst::https://github.com/$_repo/releases/download/v$pkgver/$pkgname-$pkgver-vendored.tar.zst")
sha256sums=('f7cbb65d1f631c62aa5c81935a4f340a70a2c439d0e9a9d488bf03015141b2c6')

_toolchain() { sed -n 's/^channel = "\(.*\)"/\1/p' rust-toolchain.toml; }

prepare() {
  cd "$pkgname-$pkgver"
  # The source pins a newer Rust than the repositories carry, so rustup supplies it.
  rustup which --toolchain "$(_toolchain)" rustc >/dev/null 2>&1 ||
    rustup toolchain install --profile minimal "$(_toolchain)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=$(_toolchain) EASYSHOT_RELEASE=1 CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=$HOME/.cargo=/cargo --remap-path-prefix=$HOME/.rustup=/rustup"
  cargo build --frozen --release -p easyshot --features sound,player,evdev-input
  packaging/stage.sh target/release . "$srcdir/stage"
}

package() {
  cd stage
  install -Dm755 easyshot -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/icons"
  cp -r --no-preserve=ownership icons/hicolor "$pkgdir/usr/share/icons/"
  install -Dm644 applications/*.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 systemd/easyshot.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 dbus/*.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm644 metainfo/*.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 completions/easyshot.bash "$pkgdir/usr/share/bash-completion/completions/easyshot"
  install -Dm644 completions/easyshot.zsh "$pkgdir/usr/share/zsh/site-functions/_easyshot"
  install -Dm644 completions/easyshot.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 MANUAL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -r --no-preserve=ownership LICENSES "$pkgdir/usr/share/licenses/$pkgname/"
}
