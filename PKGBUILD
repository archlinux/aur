pkgname=ssmt4-linux
pkgver=0.0.11_beta
pkgrel=1
pkgdesc="SSMT4 - Super Simple Linux Game Tools 4th"
arch=('x86_64')
url='https://github.com/xiaobai01111/SSMT4-Linux'
license=('GPL-3.0-or-later')
makedepends=('git' 'nodejs' 'pnpm' 'cargo' 'rust')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'xdg-utils')
options=('!buildflags' '!debug')
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
  'git: data-linux repository sync'
  'polkit: privileged telemetry host edits (pkexec)'
  'procps-ng: process monitoring (ps/pgrep)'
  'libayatana-appindicator: tray icon support'
  'wayland: Wayland support'
)
provides=('ssmt4-linux')
conflicts=('ssmt4-linux-git')

_github_repo='https://github.com/xiaobai01111/SSMT4-Linux.git'
_source_repo="${_github_repo}"
_source_tag="${pkgver//_/-}"
_source_name="${pkgname}"

source=(
  "${_source_name}::git+${_source_repo}#tag=${_source_tag}"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_source_name}"
  # ring currently fails to link on Arch-family release builds when LTO is enabled.
  sed -i 's/^lto = true$/lto = false/' src-tauri/Cargo.toml
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_source_name}"
  env \
    -u CPPFLAGS \
    -u CFLAGS \
    -u CXXFLAGS \
    -u LDFLAGS \
    -u RUSTFLAGS \
    -u DEBUG_RUSTFLAGS \
    -u CARGO_ENCODED_RUSTFLAGS \
    RUSTFLAGS="--remap-path-prefix=${srcdir}=." \
    CC=gcc \
    CXX=g++ \
    CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc \
    pnpm run tauri build --no-bundle
}

package() {
  cd "${srcdir}/${_source_name}"

  install -Dm755 "src-tauri/target/release/SSMT4-linux" "${pkgdir}/usr/bin/SSMT4-linux"

  install -dm755 "${pkgdir}/usr/lib/SSMT4-Linux/resources"
  if [[ -d "src-tauri/resources" ]]; then
    cp -r src-tauri/resources/* "${pkgdir}/usr/lib/SSMT4-Linux/resources/" 2>/dev/null || true
  fi
  install -Dm644 "version" "${pkgdir}/usr/lib/SSMT4-Linux/resources/version"
  install -Dm644 "version-log" "${pkgdir}/usr/lib/SSMT4-Linux/resources/version-log"

  install -dm755 "${pkgdir}/usr/lib/ssmt4"
  ln -sfn ../SSMT4-Linux/resources "${pkgdir}/usr/lib/ssmt4/resources"

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
