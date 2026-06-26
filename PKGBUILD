# Maintainer: Tymour Kadry <tymitaly@gmail.com>
pkgname=dictapulse
pkgver=0.2.0
pkgrel=1
_whisperver=1.7.6
pkgdesc="Local AI voice dictation for KDE Plasma (Wayland)"
arch=('x86_64')
url="https://dictapulse.com"
_repo="https://github.com/Silverhairfx/DictaPulse"
license=('GPL-3.0-or-later')
depends=(
  qt6-base qt6-declarative qt6-multimedia qt6-svg qt6-wayland
  kglobalaccel kstatusnotifieritem knotifications kconfig
  kcolorscheme kwindowsystem qtkeychain-qt6
  hicolor-icon-theme
)
optdepends=(
  'ydotool: text injection via uinput (needs the ydotoold daemon running)'
  'wtype: text injection on wlroots/Wayland'
)
makedepends=(cmake extra-cmake-modules git
             vulkan-headers vulkan-icd-loader shaderc)
# whisper.cpp is normally pulled by CMake FetchContent during build(), which needs
# network access and breaks clean-chroot (--nonetwork) builds. Vendor it as a real
# source and point FetchContent at the unpacked tree so build() is fully offline.
# Keep _whisperver in sync with the GIT_TAG in DictaPulse's CMakeLists.txt.
source=(
  "$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz"
  "whisper.cpp-$_whisperver.tar.gz::https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v$_whisperver.tar.gz"
)
sha256sums=('31c5dc976e32dbe8070eda8274b940fce419c4210443c7b63381a746fb94dc2a'
            '166140e9a6d8a36f787a2bd77f8f44dd64874f12dd8359ff7c1f4f9acb86202e')

build() {
  cd "DictaPulse-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDICTAPULSE_ENABLE_VULKAN=ON \
    -DFETCHCONTENT_SOURCE_DIR_WHISPER_CPP="$srcdir/whisper.cpp-$_whisperver" \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
  cmake --build build -j"$(nproc)"
}

package() {
  cd "DictaPulse-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
