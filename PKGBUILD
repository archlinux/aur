# Maintainer: graysky <therealgraysky AT proton DOT me>
# CUDA device architectures. 120a-real is Blackwell (RTX 50-series); add more
# entries, e.g. "86-real;89-real;120a-real", to cover other cards. Leave empty
# and ggml picks "native", which needs an NVIDIA card visible to nvcc while
# building. CUDA 13 dropped Maxwell/Pascal/Volta, so sm_50/60/61/70 are gone.
_cuda_arch=

pkgname=openwhispr-cuda
pkgver=1.10.0
pkgrel=2
pkgdesc="Voice-to-text dictation app with local Whisper/Parakeet and cloud models (NVIDIA CUDA GPU acceleration)"
arch=(x86_64)
url="https://github.com/OpenWhispr/openwhispr"
license=(MIT)
provides=(openwhispr)
conflicts=(openwhispr openwhispr-bin openwhispr-appimage openwhispr-vulkan)
depends=(
  alsa-lib
  at-spi2-core
  cuda
  gcc-libs
  gtk3
  libnotify
  libsecret
  libx11
  libxss
  libxtst
  nss
  nvidia-utils
  xdg-utils
)
makedepends=(
  cmake
  cuda
)
optdepends=(
  'wl-clipboard: Clipboard support on Wayland'
  'wtype: Clipboard auto-paste on wlroots Wayland'
  'xdotool: Clipboard auto-paste on X11'
  'ydotool: Clipboard auto-paste on Wayland'
)
options=('!strip' '!debug' '!lto')

# Whisper.cpp fork version used by OpenWhispr
_whisper_cpp_ver=0.0.10

source=(
  "https://github.com/OpenWhispr/openwhispr/releases/download/v${pkgver}/OpenWhispr-${pkgver}-linux-x64.tar.gz"
  "whisper.cpp-${_whisper_cpp_ver}.tar.gz::https://github.com/OpenWhispr/whisper.cpp/archive/refs/tags/${_whisper_cpp_ver}.tar.gz"
  openwhispr.service
)
sha256sums=('5bb5106da480bde6d867c671209ba47d3df94e97bc43115b8bdb4592e42a2a4b'
            '9e57833a53fe706c6dca2c43417c786851f8a1af6dbe298224b2f84856b80c92'
            'afdee79b60ad4e7184b3f5b34d7c49a332cbfecf83336d918cb801554585f447')

build() {
  cd "${srcdir}/whisper.cpp-${_whisper_cpp_ver}"

  local arch_opt=()
  [[ -n ${_cuda_arch} ]] && arch_opt=(-DCMAKE_CUDA_ARCHITECTURES="${_cuda_arch}")

  [[ -z ${NVCC_CCBIN} ]] && source /etc/profile
  local host_opt=()
  [[ -n ${NVCC_CCBIN} ]] && host_opt=(-DCMAKE_CUDA_HOST_COMPILER="${NVCC_CCBIN}")

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${host_opt[@]}" \
    -DGGML_CUDA=ON \
    "${arch_opt[@]}" \
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

  # chrome-sandbox is kept but left non-setuid: Chromium sandboxes itself via
  # user namespaces here. If you ever restrict those, chmod 4755 it and the
  # launcher picks it up instead of degrading to --no-sandbox.

  # Set permissions
  chmod +x "${dst}/open-whispr" "${dst}/chrome_crashpad_handler"
  find "${dst}/resources/bin" -type f -name '*-linux-x64' -exec chmod +x {} \;

  # Replace CPU whisper-server with CUDA build
  local cuda_bin="${srcdir}/whisper.cpp-${_whisper_cpp_ver}/build/bin/whisper-server"
  local target="${dst}/resources/bin/whisper-server-linux-x64"
  if [ -f "${cuda_bin}" ]; then
    install -Dm755 "${cuda_bin}" "${target}"
    echo "  -> Replaced whisper-server with CUDA GPU build"
  else
    echo "  -> ERROR: CUDA whisper-server not found, aborting package build" >&2
    exit 1
  fi

  # /usr/bin launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openwhispr" <<'LAUNCHER'
#!/bin/bash
# The CUDA pack the app offers to download is built against CUDA 12, so on
# Arch (CUDA 13) it dies on libcudart.so.12 and drags transcription back to
# CPU. It also outranks the bundled binary, which is already a CUDA build, so
# drop it on every launch; re-downloading it from the GPU card only undoes
# this until the next start.
_pack="${XDG_CONFIG_HOME:-$HOME/.config}/open-whispr/bin/whisper-cuda"
[ -d "$_pack" ] && rm -rf -- "$_pack"
# No --no-sandbox: /opt/openwhispr/open-whispr already picks a sandbox mode,
# and Arch's unprivileged user namespaces let Chromium sandbox itself.
exec /opt/openwhispr/open-whispr "$@"
LAUNCHER

  # .desktop file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openwhispr.desktop" <<EOF
[Desktop Entry]
Name=OpenWhispr
Comment=Voice-to-text dictation with local and cloud AI models (CUDA GPU)
Exec=/usr/bin/openwhispr %U
Icon=openwhispr
Type=Application
Categories=Utility;AudioVideo;
StartupWMClass=open-whispr
MimeType=x-scheme-handler/openwhispr;
EOF

  install -Dm644 "${srcdir}/openwhispr.service" \
    "${pkgdir}/usr/lib/systemd/user/openwhispr.service"

  install -Dm644 "${src}/resources/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/openwhispr.png"

  install -dm755 "${license_dir}"
  cp -r "${src}"/LICENSE* "${src}"/LICENSES* "${license_dir}/" 2>/dev/null || true
}
