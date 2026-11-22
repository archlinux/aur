# Maintainer: Marco Scardovi <scardracs at disroot dot org>

pkgname=orbis-reframe
pkgver=0.10.1
pkgrel=1
pkgdesc='Native Linux editor for 360° footage'
arch=('x86_64')
url='https://github.com/Schabo/orbis-reframe'
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'ncnn'
  'onnxruntime'
  'opencv'
  'qt6-base'
  'qt6-svg'
  'qt6-wayland'
  'vulkan-icd-loader'
  'zlib'
)
makedepends=(
  'cmake'
  'glslang'
  'ninja'
  'nlohmann-json'
  'vulkan-headers'
)
optdepends=(
  'libpulse: audio playback (PipeWire Pulse is compatible)'
  'nvidia-utils: NVIDIA Vulkan decode and NVENC export'
  'vulkan-radeon: AMD Vulkan'
  'vulkan-intel: Intel Vulkan'
  'libva-mesa-driver: AMD/Mesa VA-API export'
  'intel-media-driver: Intel VA-API export'
)
source=(
  "$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.xz"
)
sha256sums=(
  '8212e1c90604c658fae6b0796250ec936ad95e09aecbd96ad0cd73446182f3cc'
)
# Wayland + Vulkan GPU required at runtime (NVIDIA tested upstream; AMD/Intel best-effort).

build() {
  local cmake_options=(
    -B build
    -S "$pkgname-$pkgver"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DORBIS_SOURCE_TREE_FALLBACK=OFF
    -DORBIS_ORT_BUILD_PATH=OFF
    -DORBIS_REQUIRE_ALL_FEATURES=ON
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --target orbis-reframe
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
