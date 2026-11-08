# Maintainer: gnolruf <112510094+gnolruf@users.noreply.github.com>

pkgname=assistd
pkgver=0.6.0
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
  'espeak-ng: phonemizer for Piper (vits) text-to-speech voices'
  'searxng-git: provides searxng-run for the web search command'
  'maim: X11 full/region screenshot capture'
  'slop: maim --select region picker'
  'grim: Wayland full/region screenshot capture'
  'xdotool: X11 focused-window screenshot'
  'xorg-xrandr: X11 multi-monitor info for screenshots'
  'sway: Wayland focused-window screenshot via swaymsg'
  'hyprland: Wayland focused-window screenshot via hyprctl'
  'bubblewrap: sandboxed bash command tool'
  'pipewire-alsa: route audio through PipeWire (otherwise raw ALSA)'
  'notification-daemon: desktop notifications from the tray'
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
sha256sums=('6bb3decd6476d6f08fbd291a9c07b2072b29b84a6d250f37355fff5d531411d5')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$PWD/target"

  cargo build --release --frozen --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/assistd "$pkgdir/usr/bin/assistd"
  # sherpa-onnx for speech; the binary's runpath includes $ORIGIN/../lib/assistd.
  install -Dm644 -t "$pkgdir/usr/lib/assistd" \
    target/release/libsherpa-onnx-c-api.so target/release/libonnxruntime.so

  install -Dm644 config/config.sample.toml "$pkgdir/etc/assistd/config.toml"

  sed 's|%h/.cargo/bin/assistd|/usr/bin/assistd|' \
    dist/systemd/assistd.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/assistd.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
  cp -r docs/wm "$pkgdir/usr/share/doc/$pkgname/wm"
  install -Dm644 config/config.sample.toml \
    "$pkgdir/usr/share/doc/$pkgname/config.sample.toml"
}
