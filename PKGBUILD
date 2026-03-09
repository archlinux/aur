pkgname=ssmt4-linux
pkgver=0.0.8_beta
pkgrel=1
pkgdesc="SSMT4 - Super Simple Linux Game Tools 4th"
arch=('x86_64')
url='https://gitee.com/xiaobai01111/ssmt4-linux'
license=('GPL-3.0-or-later')
makedepends=('git' 'nodejs' 'pnpm' 'cargo' 'rust')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'xdg-utils')
optdepends=(
  'xorg-xwayland: XWayland support'
  'wine: Windows game compatibility'
  'winetricks: Wine helper scripts'
  'umu-launcher: umu-run runtime launcher'
  'bubblewrap: sandbox mode (bwrap)'
  'vulkan-tools: Vulkan diagnostics (vulkaninfo)'
  'pciutils: GPU detection (lspci)'
  '7zip: split archive extraction'
  'unzip: Proton archive extraction'
  'git: Data-parameters repository sync'
  'polkit: privileged telemetry host edits (pkexec)'
  'procps-ng: process monitoring (ps/pgrep)'
  'libayatana-appindicator: tray icon support'
  'wayland: Wayland support'
)
provides=('ssmt4-linux')
conflicts=('ssmt4-linux-git')

_github_repo='https://github.com/xiaobai14491-afk/SSMT4-Linux-bak.git'
_gitee_repo='https://gitee.com/xiaobai01111/ssmt4-linux.git'
_source_repo="${SSMT4_AUR_SOURCE_REPO:-}"
if [[ -z "${_source_repo}" ]]; then
  case "${SSMT4_AUR_SOURCE_MIRROR:-github}" in
    gitee)
      _source_repo="${_gitee_repo}"
      ;;
    *)
      _source_repo="${_github_repo}"
      ;;
  esac
fi

source=(
  "git+${_source_repo}#tag=${pkgver//_/-}"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/SSMT4-Linux"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/SSMT4-Linux"
  pnpm run build
  cargo build --manifest-path src-tauri/Cargo.toml --release
}

package() {
  cd "${srcdir}/SSMT4-Linux"

  install -Dm755 "src-tauri/target/release/SSMT4-linux" "${pkgdir}/usr/bin/SSMT4-linux"

  install -dm755 "${pkgdir}/usr/lib/ssmt4/resources"
  if [[ -d "src-tauri/resources" ]]; then
    cp -r src-tauri/resources/* "${pkgdir}/usr/lib/ssmt4/resources/" 2>/dev/null || true
  fi
  install -Dm644 "version" "${pkgdir}/usr/lib/ssmt4/resources/version"
  install -Dm644 "version-log" "${pkgdir}/usr/lib/ssmt4/resources/version-log"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ssmt4-linux.desktop" <<'DESKTOP'
[Desktop Entry]
Categories=Game;
Comment=SSMT4 Linux Launcher
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 SSMT4-linux
StartupWMClass=SSMT4-linux
Icon=SSMT4-linux
Name=SSMT4 Linux
Terminal=false
Type=Application
DESKTOP

  for size in 32x32 128x128; do
    install -Dm644 "src-tauri/icons/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/SSMT4-linux.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/SSMT4-linux.png"
}
