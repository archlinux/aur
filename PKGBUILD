# Maintainer: Charlotte cemetery394@gmail.com
pkgname=citron-neo-git
pkgver=r28571.d9f89126c
pkgrel=1
pkgdesc="Nintendo Switch emulator fork from citron-neo (git version)"
arch=('x86_64')
url="https://github.com/citron-neo/emulator"
license=('GPL-3.0-or-later')

depends=(
  'qt6-base' 'qt6-wayland' 'qt6-svg' 'qt6-multimedia' 'qt6-tools'
  'sdl2' 'vulkan-icd-loader' 'vulkan-headers' 'libdecor'
  'ffmpeg' 'opus' 'mbedtls' 'boost-libs' 'lz4' 'zstd' 'libusb'
  'glslang' 'spirv-tools' 'hicolor-icon-theme' 'libxkbcommon'
)

makedepends=(
  'git' 'cmake' 'ninja' 'python' 'boost' 'nlohmann-json'
)

provides=('citron' 'citron-git')
conflicts=('citron' 'citron-git')

source=("git+https://github.com/citron-neo/emulator.git")
sha256sums=('SKIP')

pkgver() {
  cd emulator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd emulator
  git submodule init
  git submodule update --init --recursive --jobs=$(nproc)
  git submodule sync --recursive
}

build() {
  cd emulator

  cmake -B build -S . -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-Wno-maybe-uninitialized -Wno-implicit-const-int-float-conversion" \
    -DENABLE_QT6=ON \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_BUNDLED_SDL2=OFF \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DCITRON_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DCITRON_TESTS=OFF \
    -DCMAKE_CXX_FLAGS="-march=native -O3 -pipe" \
    -DCMAKE_C_FLAGS="-march=native -O3 -pipe"

  ninja -C build
}

package() {
  cd emulator
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 dist/org.citron_emu.citron.desktop "$pkgdir/usr/share/applications/citron.desktop" 2>/dev/null || true
  install -Dm644 dist/citron.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/citron.svg" 2>/dev/null || true

  if [ -f "$pkgdir/usr/bin/citron" ]; then
    ln -sf /usr/bin/citron "$pkgdir/usr/bin/citron-neo" 2>/dev/null || true
  fi
}
