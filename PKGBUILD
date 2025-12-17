# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: Volodia Kraplich <v1mkss.m@gmail.com>

pkgname=xmcl-launcher
pkgver=0.53.2
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern, open-source Minecraft Launcher with modpack, resource, and instance management"
arch=('x86_64' 'aarch64')
url="https://xmcl.app/"
license=('MIT')
provides=('xmcl')
conflicts=('xmcl-launcher-bin')
depends=('gtk3' 'nss' 'alsa-lib' 'mesa-utils')
optdepends=(
  'jre8-openjdk: Minimum requirement for launching older game versions'
  'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
  'jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above'
  'flite: In-game narrator (Text-to-Speech) support'
  'gamemode: GameMode support for performance optimization'
  'libusb: Controller support (needed by mods like Controlify)'
  'nvidia-prime: Hybrid graphics support'
)
makedepends=('curl' 'libarchive')
options=('!strip' '!debug')

source=("xmcl.desktop" "xmcl.png")
source_x86_64=("xmcl-${pkgver}-x64.tar.xz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-x64.tar.xz")
source_aarch64=("xmcl-${pkgver}-arm64.tar.xz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-arm64.tar.xz")

sha256sums=('01407037620c1f763c16c64006c5e5457b23d3e3734b212ed543cbe3bf576a2d'
            '312763b5fa502280a694a78fd1e55a400b345e7d571020ee863e67db8f1eaec4')
sha256sums_x86_64=('87fc777496803ca0ab422e3d8816ee6b9fd166fd8bcf8d9a48e57213b193c48d')
sha256sums_aarch64=('5c9f94034de1a6e4b1ce66ca97de43b0dc480e56decf24e9decfa843ffd17af6')

prepare() {
  # Extract the appropriate archive based on architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    bsdtar -xf "xmcl-${pkgver}-x64.tar.xz"
  elif [[ "$CARCH" == "aarch64" ]]; then
    bsdtar -xf "xmcl-${pkgver}-arm64.tar.xz"
  fi
}

package() {
  # Determine the extracted directory name based on architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    _extracted_dir="xmcl-${pkgver}-x64"
  elif [[ "$CARCH" == "aarch64" ]]; then
    _extracted_dir="xmcl-${pkgver}-arm64"
  fi

  cd "${_extracted_dir}"

  # Install application files
  install -dm755 "${pkgdir}/opt/xmcl"

  # Check different possible layouts and copy all files
  if [[ -d "opt/xmcl" ]]; then
    cp -r opt/xmcl/* "${pkgdir}/opt/xmcl/"
  elif [[ -f "xmcl" ]]; then
    cp -r ./* "${pkgdir}/opt/xmcl/"
  else
    error "Cannot determine archive layout"
    return 1
  fi

  # Install Desktop file and Icon
  install -Dm644 "${srcdir}/xmcl.desktop" "${pkgdir}/usr/share/applications/xmcl.desktop"
  install -Dm644 "${srcdir}/xmcl.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/xmcl.png"

  sed -i 's|^Exec=.*|Exec=/usr/bin/xmcl %U|' "${pkgdir}/usr/share/applications/xmcl.desktop"

  # Create wrapper script with Flatpak-like optimizations
  install -dm755 "${pkgdir}/usr/bin"

  cat > "${pkgdir}/usr/bin/xmcl" <<EOF
#!/usr/bin/env bash

# Fix audio spatial positioning and latency
export PULSE_PROP='media.role=game'
export PULSE_LATENCY_MSEC=60

# AppImage compatibility mode for Electron logic
export APPIMAGE=1

# Default flags for better hardware support
OPTS=(
  "--enable-webrtc-pipewire-capturer"
  "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder"
  "--disable-gpu-driver-bug-workarounds"
  "--disable-dev-shm-usage"
  "--no-sandbox"
)

# Auto-detect Wayland: enable ozone hint and IME support
if [[ "\$XDG_SESSION_TYPE" == "wayland" ]]; then
    OPTS+=("--ozone-platform-hint=auto")
    OPTS+=("--enable-wayland-ime")
fi

# Pass specific flags first, then arguments (like URLs)
exec /opt/xmcl/xmcl "\${OPTS[@]}" "\$@"
EOF

  # Set proper permissions
  chmod 755 "${pkgdir}/usr/bin/xmcl"
  chmod 755 "${pkgdir}/opt/xmcl/xmcl"
  [[ -f "${pkgdir}/opt/xmcl/chrome-sandbox" ]] && chmod 4755 "${pkgdir}/opt/xmcl/chrome-sandbox"
}
