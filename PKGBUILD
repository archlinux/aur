# Maintainer: sumerjakhar78 (AUR), sumerchoudhary78 (GitHub)
pkgname=hyprlume
pkgver=0.2.0
pkgrel=1
pkgdesc='Glass command shell and local English voice companion for Hyprland, powered by HyprPilot'
arch=('x86_64' 'aarch64')
url='https://github.com/sumerchoudhary78/hyprlume'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'systemd' 'quickshell' 'qt6-declarative' 'qt6-wayland' 'qt6-quick3d>=6.9' 'hyprland' 'pipewire-audio' 'wireplumber' 'python')
makedepends=('cargo' 'git')
optdepends=('espeak-ng: phonemization for local Piper speech output'
            'inter-font: shell sans-serif font'
            'ttf-jetbrains-mono: shell monospace font')
# GCC LTO objects in native Cargo build dependencies cannot be linked by
# rust-lld. Cargo's own thin LTO remains enabled in the release profile.
options=('!lto')
source=("git+$url.git#tag=v$pkgver")
source_x86_64=('https://github.com/k2-fsa/sherpa-onnx/releases/download/v2.0.1/sherpa-onnx-v2.0.1-linux-x64-static-lib.tar.bz2')
source_aarch64=('https://github.com/k2-fsa/sherpa-onnx/releases/download/v2.0.1/sherpa-onnx-v2.0.1-linux-aarch64-static-lib.tar.bz2')
sha256sums=('SKIP')
sha256sums_x86_64=('55cfadf65ba50d0afc1a802b7a337942819e51c94a5b5a384def1978f7c70871')
sha256sums_aarch64=('b6c6090e40fd18d6812f04fe21260602cd1223d7b5e83ad39dab87ad7c1c031d')
noextract=('sherpa-onnx-v2.0.1-linux-x64-static-lib.tar.bz2' 'sherpa-onnx-v2.0.1-linux-aarch64-static-lib.tar.bz2')

prepare() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/hyprlume"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  export SHERPA_ONNX_ARCHIVE_DIR="$srcdir"
  cd "$srcdir/hyprlume"
  cargo build --release --frozen
}

check() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  export SHERPA_ONNX_ARCHIVE_DIR="$srcdir"
  cd "$srcdir/hyprlume"
  cargo test --release --frozen --all-targets
}

package() {
  cd "$srcdir/hyprlume"
  install -Dm755 target/release/hyprlume "$pkgdir/usr/bin/hyprlume"
  install -Dm755 scripts/hyprlume-models "$pkgdir/usr/bin/hyprlume-models"
  # The shell is a module tree (`qs.*` imports resolve against this directory),
  # so the whole tree ships, not a hand-maintained file list.
  install -d "$pkgdir/usr/share/hyprlume/shell"
  cp -r shell/. "$pkgdir/usr/share/hyprlume/shell/"
  # QA entries and synthetic data belong in source checkouts, not the runtime.
  rm -r "$pkgdir/usr/share/hyprlume/shell/fixtures"
  rm "$pkgdir/usr/share/hyprlume/shell/design-preview.qml" "$pkgdir/usr/share/hyprlume/shell/ipc-test.qml"
  find "$pkgdir/usr/share/hyprlume/shell" -name '*.sh' -exec chmod 755 {} +
  install -Dm644 assets/hyprlume.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprlume.svg"
  install -Dm644 packaging/io.github.sumerchoudhary78.hyprlume.desktop "$pkgdir/usr/share/applications/io.github.sumerchoudhary78.hyprlume.desktop"
  install -Dm644 packaging/systemd/hyprlume-daemon.service "$pkgdir/usr/lib/systemd/user/hyprlume-daemon.service"
  install -Dm644 packaging/systemd/hyprlume-shell.service "$pkgdir/usr/lib/systemd/user/hyprlume-shell.service"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs/. "$pkgdir/usr/share/doc/$pkgname/"
}
