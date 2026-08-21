# Maintainer: malkiii <https://github.com/mxmilkiib>
# Contributor: Orion-zhen <https://github.com/Orion-zhen>

# Based on the official extra/whisper-cpp PKGBUILD by Maxime Gauduin.
# Adds SDL2 support so whisper-stream, whisper-command, whisper-lsp, and
# wchess are built. Uses system ggml (provided by llama.cpp-gfx1151,
# llama.cpp-vulkan, llama.cpp-hip, or extra/ggml) for GPU acceleration.
# talk-llama is disabled — it breaks against current system ggml's
# ggml_ssm_scan API and is a voice chat demo, not needed for dictation.

_pkgbase=whisper.cpp
pkgname=whisper-cpp-sdl
pkgver=1.9.1
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with SDL2 examples, system ggml)"
arch=('x86_64' 'aarch64')
url="https://github.com/ggml-org/whisper.cpp"
license=("MIT")
depends=(
  'ffmpeg'
  'ggml'
  'glibc'
  'libgcc'
  'libstdc++'
  'sdl2'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
conflicts=("whisper-cpp")
provides=("whisper-cpp")
source=(
  "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "whisper.cpp.service"
  "whisper.cpp.conf"
)
sha256sums=(
  '147267177eef7b22ec3d2476dd514d1b12e160e176230b740e3d1bd600118447'
  'd67695c9f259a50c23cbff08e5105b1d127b75336909f5f61d1fa87901826801'
  'ce241dc37fb9724842eead940bda305f9b4a6dc7e426151c8e8cd8b34d4a1262'
)

prepare() {
  cd "${_pkgbase}-${pkgver}"
  # talk-llama uses ggml_ssm_scan with the old 8-arg signature; system ggml
  # now requires a 9th arg (int64_t K). Disable it — it's a voice chat demo,
  # not needed for whisper-stream/whisper-server/dictation
  sed -i '/add_subdirectory(talk-llama)/d' examples/CMakeLists.txt
}

build() {
  cmake -S "${_pkgbase}-${pkgver}" -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWHISPER_COMMON_FFMPEG=ON \
      -DWHISPER_BUILD_EXAMPLES=ON \
      -DWHISPER_BUILD_SERVER=ON \
      -DWHISPER_BUILD_TESTS=OFF \
      -DWHISPER_SDL2=ON \
      -DWHISPER_USE_SYSTEM_GGML=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # wchess has no install() rule in upstream CMakeLists
  install -Dm755 build/bin/wchess "${pkgdir}/usr/bin/wchess"

  install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" \
      -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 whisper.cpp.conf \
      "${pkgdir}/etc/conf.d/whisper.cpp"
  install -Dm644 whisper.cpp.service \
      "${pkgdir}/usr/lib/systemd/system/whisper.cpp.service"
}
