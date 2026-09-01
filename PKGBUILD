# Maintainer: Daniel Caixinha <2683004+dcaixinha@users.noreply.github.com>
pkgname=agent-session-status
pkgver=0.1.1
pkgrel=1
pkgdesc='Show coding-agent session status in desktop status bars'
arch=('x86_64')
url='https://github.com/dcaixinha/agent-session-status'
license=('MIT' 'CC0-1.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!debug')
optdepends=(
  'waybar: Waybar status bar integration'
  'ironbar: Ironbar status bar integration'
  'otf-font-awesome: default status glyphs'
  'libnotify: desktop idle notifications'
  'pipewire-audio: idle sound playback through pw-play'
  'libpulse: fallback idle sound playback through paplay'
  'hyprland: workspace association through hyprctl'
  'opencode: local OpenCode session events'
  'claude-code: local Claude Code session events'
  'openai-codex-bin: local Codex session events'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e781355eacbb20cd4cf0c6a63b19f8b325ebb1c85910ca932740bc3077174a32')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 target/release/agent-session-status \
    "$pkgdir/usr/bin/agent-session-status"

  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" \
    assets/opencode-logo-light-square.svg \
    assets/opencode-logo-dark-square.svg \
    assets/agent-complete.wav \
    assets/LICENSE.OpenCode

  install -Dm0644 integrations/opencode/agent-session-status.ts \
    "$pkgdir/usr/share/$pkgname/integrations/opencode/agent-session-status.ts"
  install -Dm0644 integrations/claude/settings.json \
    "$pkgdir/usr/share/$pkgname/integrations/claude/settings.json"
  install -Dm0644 integrations/codex/hooks.json \
    "$pkgdir/usr/share/$pkgname/integrations/codex/hooks.json"

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/*
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    CHANGELOG.md \
    README.md \
    THIRD_PARTY_NOTICES.md
  install -Dm0644 assets/README.md \
    "$pkgdir/usr/share/doc/$pkgname/ASSETS.md"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 assets/LICENSE.OpenCode \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.OpenCode"
}
