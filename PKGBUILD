pkgname=openwhispr-vulkan
pkgver=1.8.3
pkgrel=1
pkgdesc="Voice-to-text dictation app with local Whisper/Parakeet and cloud models (Vulkan GPU acceleration)"
arch=('x86_64')
url="https://github.com/OpenWhispr/openwhispr"
license=('MIT')
provides=('openwhispr')
conflicts=('openwhispr' 'openwhispr-bin' 'openwhispr-appimage')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gcc-libs'
  'gtk3'
  'libnotify'
  'libsecret'
  'libx11'
  'libxss'
  'libxtst'
  'nss'
  'vulkan-icd-loader'
  'vulkan-driver'
  'xdg-utils'
)
makedepends=(
  'cmake'
  'gcc'
  'shaderc'
  'spirv-headers'
  'vulkan-headers'
)
optdepends=(
  'ydotool: Clipboard auto-paste on Wayland'
  'xdotool: Clipboard auto-paste on X11'
  'wtype: Clipboard auto-paste on wlroots Wayland'
  'wl-clipboard: Clipboard support on Wayland'
)
options=('!strip' '!debug')

# Whisper.cpp fork version used by OpenWhispr
_whisper_cpp_ver=0.0.9

source=(
  "https://github.com/OpenWhispr/openwhispr/releases/download/v${pkgver}/OpenWhispr-${pkgver}-linux-x64.tar.gz"
  "whisper.cpp-${_whisper_cpp_ver}.tar.gz::https://github.com/OpenWhispr/whisper.cpp/archive/refs/tags/${_whisper_cpp_ver}.tar.gz"
)
sha256sums=('5f8f973cea4b0ad5ae574c0317e3703f572de32982da23d452c2d796f283ffbe'
            'b12474c8b951116ddd7bbe5fb6c24924cd1f885517adc44f583a7eb9ca45c11c')
# ^ Placeholders: the CI workflow replaces these with real SHA-256 sums
#   via `updpkgsums` every time either version is bumped.

build() {
  cd "${srcdir}/whisper.cpp-${_whisper_cpp_ver}"

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGGML_VULKAN=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DWHISPER_BUILD_EXAMPLES=ON \
    -DWHISPER_BUILD_SERVER=ON \
    -DWHISPER_BUILD_TESTS=OFF

  cmake --build build --target whisper-server -j"$(nproc)"
}

package() {
  local src="${srcdir}/OpenWhispr-${pkgver}-linux-x64"
  local dst="${pkgdir}/opt/openwhispr"
  local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"

  # Install official app to /opt/openwhispr
  install -dm755 "${dst}"
  cp -r "${src}"/* "${dst}/"

  # Remove chrome-sandbox (not needed with --no-sandbox)
  rm -f "${dst}/chrome-sandbox"

  # Set permissions
  chmod +x "${dst}/open-whispr" "${dst}/chrome_crashpad_handler"
  find "${dst}/resources/bin" -type f -name '*-linux-x64' -exec chmod +x {} \;

  # Replace CPU whisper-server with Vulkan build
  local vulkan_bin="${srcdir}/whisper.cpp-${_whisper_cpp_ver}/build/bin/whisper-server"
  local target="${dst}/resources/bin/whisper-server-linux-x64"
  if [ -f "${vulkan_bin}" ]; then
    install -Dm755 "${vulkan_bin}" "${target}"
    echo "  -> Replaced whisper-server with Vulkan GPU build"
  else
    echo "  -> ERROR: Vulkan whisper-server not found, aborting package build" >&2
    exit 1
  fi

  # /usr/bin launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openwhispr" <<'LAUNCHER'
#!/bin/bash
exec /opt/openwhispr/open-whispr --no-sandbox "$@"
LAUNCHER

  # .desktop file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openwhispr.desktop" <<EOF
[Desktop Entry]
Name=OpenWhispr
Comment=Voice-to-text dictation with local and cloud AI models (Vulkan GPU)
Exec=/opt/openwhispr/open-whispr --no-sandbox %U
Icon=openwhispr
Type=Application
Categories=Utility;AudioVideo;
StartupWMClass=open-whispr
MimeType=x-scheme-handler/openwhispr;
EOF

  # Icon
  install -Dm644 "${src}/resources/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/openwhispr.png"

  # License
  install -dm755 "${license_dir}"
  cp -r "${src}"/LICENSE* "${src}"/LICENSES* "${license_dir}/" 2>/dev/null || true
}
