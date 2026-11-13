# Maintainer: Marco Scardovi <scardracs at disroot dot org>

pkgname=orbis-reframe
pkgver=0.9.1
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
  'system-ncnn.patch'
)
sha256sums=(
  '8dfe353e56f5d8f87d730f0531ec5b0f0d6dc11b0fcec8b815ce206e2b3befa4'
  'e2bfeb1c3369ee05b2288ee3aba7d1ec2425837caedd2443912811922c783ba1'
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
  cmake --build build --target orbis-reframe
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
