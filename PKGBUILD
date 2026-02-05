# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-vulkan"
pkgver=1.8.3
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (using system llama.cpp-vulkan)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggml-org/whisper.cpp"
license=("MIT")
depends=('llama.cpp-vulkan' 'sdl2-compat' 'ffmpeg')
conflicts=("${_pkgbase}" "${_pkgbase}-hip")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
  'shaderc'
  'vulkan-headers'
)
source=(
  "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  # disable-talk-llama.patch
)

sha256sums=('870ba21409cdf66697dc4db15ebdb13bc67037d76c7cc63756c81471d8f1731a')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  # patch -Np1 -i "${srcdir}/disable-talk-llama.patch"
}

build() {
  local _cmake_options=(
    -B "${srcdir}/build"
    -S "${srcdir}/${_pkgbase}-${pkgver}"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=Release
    -DWHISPER_SDL2=ON
    -DWHISPER_FFMPEG=ON
    -DWHISPER_BUILD_SERVER=ON
    -DWHISPER_BUILD_TESTS=OFF
    -DWHISPER_USE_SYSTEM_GGML=ON
    -DGGML_LTO=ON
    # -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_VULKAN=ON
  )

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    # 启用通用构建
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
    )
  else
    # 本地构建, 针对当前设备优化
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  cmake "${_cmake_options[@]}"

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
  for i in bench command main stream; do
    if test -e "${srcdir}/build/bin/$i"; then
      rm "${srcdir}/build/bin/$i"
    fi
  done
  cp -r "${srcdir}/build/bin" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
