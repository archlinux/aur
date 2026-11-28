# Maintainer: bit-loop <isaiah.fpga@gmail.com>

pkgname=bbscord
pkgver=1.0.1
pkgrel=1
pkgdesc='Retro BBS-styled Rust Discord TUI with DAVE E2EE voice, WebRTC video, and GIFs'
arch=('x86_64' 'aarch64')
url='https://github.com/Bit-Loop/bbscord'
license=('MIT OR Apache-2.0')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glib2'
  'glibc'
  'gst-plugins-bad'
  'gst-plugins-bad-libs'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gstreamer'
  'opus'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'pkgconf'
)
checkdepends=(
  'gst-libav'
  'gst-plugins-ugly'
)
optdepends=(
  'btop: system btop .theme palettes auto-discovered in /usr/share/btop/themes'
  'gst-libav: software H.264/VP8/VP9 fallback decoding for Go Live screenshares'
  'gst-plugins-ugly: x264enc software H.264 broadcasting fallback'
  'mpv: low-latency borderless pop-out window sink for Go Live screenshares'
  'pipewire: Wayland screen capture and low-latency audio routing'
  'wl-clipboard: Wayland clipboard copy and Ctrl+V image paste'
  'xclip: X11 clipboard copy and Ctrl+V image paste'
  'xdg-desktop-portal: Wayland/X11 portal monitor and window picker for Go Live'
)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1518b297008c43bc8711c59eccf41fea17c9f067f0bef0dcc43a8effd753a902')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cargo build --frozen --release -p bbscord
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cargo test --frozen --workspace
  ./target/release/bbscord --headless-smoke
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/bbscord" "${pkgdir}/usr/bin/bbscord"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
