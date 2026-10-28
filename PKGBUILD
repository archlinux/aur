# Maintainer: Marco Scardovi <scardracs at disroot dot org>

pkgname=orbis-reframe
pkgver=0.7.0
pkgrel=1
pkgdesc='Native Linux editor for Insta360 360° footage: stitch, stabilize and reframe'
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
  'system-ncnn.patch'
)
sha256sums=(
  'aa61a8c2f903b0bf3c6071feee9f94e9c38f46019849e586fa120779d6ff0106'
  'e089ecbbbf3edb65c8e0368c7139c1df77a226cb750745efd99a537b5223bf68'
)
# Wayland + Vulkan GPU required at runtime (NVIDIA tested upstream; AMD/Intel best-effort).

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/system-ncnn.patch"
}

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
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
