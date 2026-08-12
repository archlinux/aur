# Maintainer: OldJobobo
pkgbase=splinterm
pkgname=('splinterm' 'splinterm-mcp')
pkgver=0.1.1alpha1
_upstream_ver=0.1.1-alpha.1
pkgrel=2
arch=('x86_64')
url='https://github.com/oldjobobo/splinterm'
license=('MIT')
makedepends=(
  'cargo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'hicolor-icon-theme'
  'libxkbcommon'
  'noto-fonts-cjk'
  'noto-fonts-emoji'
  'pixman'
  'pkgconf'
  'python'
  'rust'
  'ttf-jetbrains-mono-nerd'
  'wayland'
  'xdg-terminal-exec'
)
source=(
  "https://github.com/OldJobobo/splinterm/releases/download/v$_upstream_ver/$pkgbase-$_upstream_ver.tar.gz"
)
sha256sums=(
  '9e1bd902a5cf4bbfb258848091a2d154e4cd2df8e3446f30d937d6fc0052a4c3'
)

prepare() {
  cd "$pkgbase-$_upstream_ver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$_upstream_ver"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release \
    -p splinterm -p splinterd -p splinterm-relay -p splinterm-pty -p splinterm-mcp
}

package_splinterm() {
  pkgdesc='Persistent Wayland terminal for humans and bounded automation'
  depends=(
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libxkbcommon'
    'noto-fonts-cjk'
    'noto-fonts-emoji'
    'pixman'
    'python'
    'ttf-jetbrains-mono-nerd'
    'wayland'
    'xdg-terminal-exec'
  )
  optdepends=(
    'fcitx5: Wayland text-input support'
    'splinterm-mcp: explicitly configured MCP stdio adapter'
  )
  install=splinterm.install

  cd "$pkgbase-$_upstream_ver"
  install -Dm755 target/release/splinterm "$pkgdir/usr/bin/splinterm"
  install -Dm755 target/release/splinterd "$pkgdir/usr/bin/splinterd"
  install -Dm755 target/release/splinterm-relay "$pkgdir/usr/bin/splinterm-relay"
  install -Dm755 target/release/splinterm-pty-child "$pkgdir/usr/bin/splinterm-pty-child"
  install -Dm755 dist/bin/splinterm-xdg-terminal-exec "$pkgdir/usr/bin/splinterm-xdg-terminal-exec"
  ln -s splinterm-xdg-terminal-exec "$pkgdir/usr/bin/splinterm-dojos"
  ln -s splinterm-xdg-terminal-exec "$pkgdir/usr/bin/splinterm-sessions"
  ln -s splinterm-xdg-terminal-exec "$pkgdir/usr/bin/splinterm-reopen"
  install -Dm755 tools/generate-omarchy-theme.py "$pkgdir/usr/bin/generate-omarchy-theme.py"
  install -Dm755 tools/automation/splinterm-dojo-picker.py \
    "$pkgdir/usr/bin/splinterm-dojo-picker"
  ln -s splinterm-dojo-picker "$pkgdir/usr/bin/splinterm-session-picker"

  install -Dm644 dist/applications/com.oldjobobo.splinterm.desktop \
    "$pkgdir/usr/share/applications/com.oldjobobo.splinterm.desktop"
  install -Dm644 dist/metainfo/com.oldjobobo.splinterm.metainfo.xml \
    "$pkgdir/usr/share/metainfo/com.oldjobobo.splinterm.metainfo.xml"
  install -Dm644 dist/icons/com.oldjobobo.splinterm.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.oldjobobo.splinterm.svg"
  install -Dm644 dist/systemd/user/splinterd.service \
    "$pkgdir/usr/lib/systemd/user/splinterd.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/splinterm/README.md"
  install -Dm644 config/splinterm/config.ini "$pkgdir/usr/share/doc/splinterm/config.ini"
  install -Dm644 config/splinterm/presets.toml \
    "$pkgdir/usr/share/doc/splinterm/presets.example.toml"
  install -Dm644 config/splinterm/theme.json "$pkgdir/usr/share/doc/splinterm/theme.json"
  install -Dm644 dist/xdg-terminals.list "$pkgdir/usr/share/doc/splinterm/xdg-terminals.list"
  install -Dm644 docs/packaging.md "$pkgdir/usr/share/doc/splinterm/packaging.md"
  install -Dm644 docs/headless.md "$pkgdir/usr/share/doc/splinterm/headless.md"
  install -Dm644 docs/automation.md "$pkgdir/usr/share/doc/splinterm/automation.md"
  install -Dm644 docs/cli.md "$pkgdir/usr/share/doc/splinterm/cli.md"
  install -Dm644 docs/configuration.md "$pkgdir/usr/share/doc/splinterm/configuration.md"
  install -Dm644 docs/integrations.md "$pkgdir/usr/share/doc/splinterm/integrations.md"
  install -Dm644 docs/images.md "$pkgdir/usr/share/doc/splinterm/images.md"
  install -Dm644 docs/omarchy-tmux-reference.md \
    "$pkgdir/usr/share/doc/splinterm/omarchy-tmux-reference.md"
  install -Dm644 docs/presets.md "$pkgdir/usr/share/doc/splinterm/presets.md"
  install -Dm644 docs/remote.md "$pkgdir/usr/share/doc/splinterm/remote.md"
  install -Dm644 docs/usage.md "$pkgdir/usr/share/doc/splinterm/usage.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/splinterm/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/splinterm/THIRD_PARTY.md"
}

package_splinterm-mcp() {
  pkgdesc='Policy-scoped MCP stdio adapter for Splinterm'
  depends=("splinterm=$pkgver-$pkgrel" 'gcc-libs' 'glibc')

  cd "$pkgbase-$_upstream_ver"
  install -Dm755 target/release/splinterm-mcp "$pkgdir/usr/bin/splinterm-mcp"
  install -Dm644 docs/mcp.md "$pkgdir/usr/share/doc/splinterm/mcp.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/splinterm-mcp/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/splinterm-mcp/THIRD_PARTY.md"
}
