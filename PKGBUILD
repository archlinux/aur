# Maintainer: gnolruf <112510094+gnolruf@users.noreply.github.com>

pkgname=assistd
pkgver=1.0.0
pkgrel=1
pkgdesc="A local-model agent daemon for Linux (LLM + voice + tools + WM integration)"
arch=('x86_64')
url="https://github.com/gnolruf/assistd"
license=('Apache-2.0')
# cargo handles its own LTO; makepkg's -flto leaves slim-LTO bitcode in
# C-dep static libs that rust-lld can't resolve.
options=('!lto')
depends=(
  'alsa-lib'
  'dbus'
)
optdepends=(
  'llama.cpp: provides llama-server (required to run a local LLM backend)'
  'piper-tts: Piper text-to-speech voice output'
  'maim: X11 full/region screenshot capture'
  'slop: maim --select region picker'
  'grim: Wayland full/region screenshot capture'
  'xdotool: X11 focused-window screenshot'
  'xorg-xrandr: X11 multi-monitor info for screenshots'
  'sway: Wayland focused-window screenshot via swaymsg'
  'hyprland: Wayland focused-window screenshot via hyprctl'
  'bubblewrap: sandboxed bash command tool'
  'pipewire-pulse: PulseAudio routing for audio playback (otherwise raw ALSA)'
  'libxkbcommon: tray-popup GUI (dlopened at runtime)'
  'libxcb: tray-popup GUI on X11 (dlopened at runtime)'
  'wayland: tray-popup GUI on Wayland (dlopened at runtime)'
  'libglvnd: tray-popup GUI OpenGL renderer (dlopened at runtime)'
  'fontconfig: tray-popup GUI text rendering (dlopened at runtime)'
)
makedepends=(
  'rust'
  'cmake'
  'clang'
  'pkgconf'
  'git'
)
backup=('etc/assistd/config.toml')
install=assistd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6253dc8fa36c66c0d883f89346176ad59e037ce97cc0a77a0c14e5fa80aec341')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target

  # x86-64-v3 baseline. Upstream GGML_NATIVE=ON would inject -march=native
  # and tie the binary to the build host's CPU.
  export GGML_NATIVE=OFF
  export GGML_AVX=ON
  export GGML_AVX2=ON
  export GGML_FMA=ON

  # TODO: drop once whisper-rs-sys bumps to a whisper.cpp with the const
  # cast in ggml/src/ggml-cpu/arch/x86/repack.cpp fixed. GCC >= 15 rejects
  # the current code as a hard error.
  export CXXFLAGS="${CXXFLAGS:-} -fpermissive"

  cargo build --release --frozen --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/assistd "$pkgdir/usr/bin/assistd"

  install -Dm644 config/config.sample.toml "$pkgdir/etc/assistd/config.toml"

  sed 's|%h/.cargo/bin/assistd|/usr/bin/assistd|' \
    dist/systemd/assistd.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/assistd.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
  install -Dm644 docs/tools.md "$pkgdir/usr/share/doc/$pkgname/tools.md"
  cp -r docs/wm "$pkgdir/usr/share/doc/$pkgname/wm"
  install -Dm644 config/config.sample.toml \
    "$pkgdir/usr/share/doc/$pkgname/config.sample.toml"
}
