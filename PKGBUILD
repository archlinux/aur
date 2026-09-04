# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>

pkgname=spirula-studio-git
pkgver=2026.9.2.r9.g8979836
pkgrel=1
pkgdesc="End-to-end 3D Gaussian Splatting pipeline (Vulkan backend), git version"
arch=('x86_64' 'aarch64')
url="https://github.com/harry7557558/spirula-studio"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'glfw'
  'hicolor-icon-theme'
  'libglvnd'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'vulkan-headers'
)
optdepends=(
  'colmap: COLMAP SfM fallback'
  'ffmpeg: video frame extraction fallback'
  'kdialog: native KDE file picker dialog'
  'python: AI masking script fallback'
  'zenity: native GTK file picker dialog'
)
provides=("spirula-studio=${pkgver%%.r*}")
conflicts=('spirula-studio')

_slangver=2026.12.0.1
_imguiver=1.92.8

source=(
  "git+https://github.com/harry7557558/spirula-studio.git"
  "imgui-${_imguiver}.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v${_imguiver}.tar.gz"
  "use-system-glfw.patch"
  "spirula-studio.desktop"
)
source_x86_64=(
  "slang-${_slangver}-linux-${CARCH}.tar.gz::https://github.com/shader-slang/slang/releases/download/v${_slangver}/slang-${_slangver}-linux-x86_64.tar.gz"
)
source_aarch64=(
  "slang-${_slangver}-linux-${CARCH}.tar.gz::https://github.com/shader-slang/slang/releases/download/v${_slangver}/slang-${_slangver}-linux-aarch64.tar.gz"
)
noextract=(
  "slang-${_slangver}-linux-${CARCH}.tar.gz"
)
sha256sums=('SKIP'
            'fecb33d33930e12ff53a34064e9d3a06c8f7c3e04408f14cd36c80e3faac863b'
            'cf015b623bca66d6a55711bbf428b155d1cdd6c0656ef7c7d587ddf29f474de7'
            '9637abbeb17aa1fff2ba542ad17be4bd5d91b814008b620b2bedb950c2a7e0ca')
sha256sums_x86_64=('bbd36968b5aefdf91c2ede0d2e131f8b552cba6ed2444da59f1a0bc0bfc6792d')
sha256sums_aarch64=('8ad6a8449e18d183aa3b75cb3c8421fd5eb5396ee4b095eba69aec75c022f5d3')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  patch -Np1 -i "${srcdir}/use-system-glfw.patch"

  mkdir -p "${srcdir}/slang"
  bsdtar -xf "${srcdir}/slang-${_slangver}-linux-${CARCH}.tar.gz" -C "${srcdir}/slang"
}

build() {
  cmake -B build -S "${srcdir}/${pkgname%-git}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSS_BACKEND=vulkan \
    -DSS_BUILD_CLI=ON \
    -DSS_BUILD_GUI=ON \
    -DSS_CHECK_COMMENTS=OFF \
    -DSS_SLANGC="${srcdir}/slang/bin/slangc" \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_IMGUI="${srcdir}/imgui-${_imguiver}"
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Main executable
  install -Dm755 "${srcdir}/build/spirula" "${pkgdir}/usr/bin/spirula"

  # Compatibility / subcommand symlinks
  ln -s spirula "${pkgdir}/usr/bin/spirula-studio"
  ln -s spirula "${pkgdir}/usr/bin/spirula-sfm"
  ln -s spirula "${pkgdir}/usr/bin/spirula-sam"

  # Desktop file and icons
  install -Dm644 "${srcdir}/spirula-studio.desktop" "${pkgdir}/usr/share/applications/spirula-studio.desktop"
  install -Dm644 assets/icon_128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/spirula-studio.png"
  install -Dm644 assets/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/spirula-studio.png"
  install -Dm644 assets/icon_128.png "${pkgdir}/usr/share/pixmaps/spirula-studio.png"

  # License and documentation
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
