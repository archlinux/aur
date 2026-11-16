# Maintainer: shenli306 <shenli306@users.noreply.github.com>
#
# Launcher shell for the DeepSeek Harness desktop app, tuned for Hyprland on
# Wayland with an NVIDIA GPU. It replaces the packaged Electron entry point with
# a small Rust orchestrator that:
#   * spawns the dsh desktop-host over a socketpair IPC channel (Node's process.send
#     needs an AF_UNIX socket; a pipe fails with write EINVAL),
#   * waits for the authenticated URL instead of scraping a listening port
#     (a bare port answers 401 "dsh web authentication required"),
#   * points a V8 compile cache at $XDG_CACHE_HOME (saves 1.5-2.5s per start),
#   * hosts the UI in a plain Electron runtime with the Wayland/NVIDIA switches
#     that actually work on Electron 44 (use-gl=angle + use-angle=gl; use-gl=egl
#     makes the GPU process exit), plus content-visibility on old turns, a focus
#     aware rAF governor and an RSS watchdog.
# Measured on the maintainer's machine: 3.1-3.5s to a usable URL, 58.4fps with
# 0.2% dropped frames while scrolling, 446->486MB over an hour. See the upstream
# repository's docs/measure.md for the method.

pkgname=dsh-hyprland
pkgver=0.1.0.r3.gc8c7b1c
pkgrel=1
pkgdesc='Hyprland/NVIDIA launcher for DeepSeek Harness: Rust orchestration, Electron WebView'
arch=('x86_64')
url='https://github.com/shenli306/dsh-hyprland'
license=('MIT')
depends=('deepseek-harness-desktop' 'electron42')
makedepends=('cargo' 'git')
options=('!strip' '!debug')
source=("$pkgname::git+https://github.com/shenli306/dsh-hyprland.git#commit=c8c7b1cadee94047fcdd8a8ea4d00a223d72bbf7")
sha256sums=('SKIP')

# The version lives in shell/Cargo.toml; AUR rejects a PKGBUILD whose .SRCINFO
# disagrees with it, so derive the canonical form here instead of editing two
# files on every release. Pin `source` to a commit and the result is stable.
pkgver() {
  cd "$pkgname"
  local ver
  ver=$(sed -n 's/^version[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/p' shell/Cargo.toml | head -1)
  printf '%s.r%s.g%s' "${ver:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --release --manifest-path shell/Cargo.toml
}

package() {
  cd "$pkgname"

  install -Dm755 shell/target/release/dsh-shell-hyprland \
    "$pkgdir/usr/lib/dsh-hyprland/dsh-shell-hyprland"
  install -Dm755 bin/dsh-hyprland "$pkgdir/usr/bin/dsh-hyprland"

  install -d "$pkgdir/usr/share/dsh-hyprland/webview"
  install -m644 shell/webview/main.cjs shell/webview/package.json shell/webview/preload.cjs \
    "$pkgdir/usr/share/dsh-hyprland/webview/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dsh-hyprland.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=DeepSeek Harness (Hyprland)
Comment=DeepSeek Harness through the dsh-hyprland launcher shell
Exec=dsh-hyprland %U
Icon=deepseek-harness
Terminal=false
StartupNotify=true
StartupWMClass=dsh-hyprland-webview
Categories=Development;
Keywords=AI;agent;deepseek;harness;dsh;hyprland;wayland;
MimeType=x-scheme-handler/dsh;
DESKTOP

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
