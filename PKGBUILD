# Maintainer: Bink

pkgname=whisper-cpp-cuda-git
_pkgsrc=whisper.cpp
pkgver=1.9.3.r182.g52a939a
pkgrel=1
pkgdesc="High-performance inference of OpenAI's Whisper automatic speech recognition (ASR) model (leveraging NVIDIA CUDA optimizations)"
arch=(x86_64 aarch64)
url=https://github.com/ggml-org/whisper.cpp
license=(MIT)
depends=(
  ffmpeg
  glibc
  gcc-libs
  llama.cpp-cuda-git
  nvidia-utils
  sdl2-compat
)
provides=(
  "whisper-cpp=${pkgver}"
)
conflicts=(
  whisper-cpp
  whisper.cpp
  whisper.cpp-cuda
)
makedepends=(
  cmake
  git
  ninja
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}" || exit
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "${_pkgsrc}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWHISPER_COMMON_FFMPEG=ON \
    -DWHISPER_SDL2=ON \
    -DWHISPER_BUILD_EXAMPLES=ON \
    -DWHISPER_BUILD_SERVER=ON \
    -DWHISPER_BUILD_TESTS=OFF \
    -DWHISPER_USE_SYSTEM_LLAMA=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # wchess is built but has no upstream cmake install() rule
  install -Dm755 build/bin/wchess "${pkgdir}/usr/bin/wchess"

  install -Dm644 "${_pkgsrc}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
