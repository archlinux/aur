# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=audio.cpp-cuda-git
_pkgname=audio.cpp
pkgver=r424.5fda891
pkgrel=1
pkgdesc='All-in-one C++ audio inference engine on ggml with NVIDIA CUDA support (git version)'
arch=('x86_64')
url='https://github.com/0xShug0/audio.cpp'
license=('Apache-2.0')
depends=(
  'cuda'
  'gcc-libs'
  'glibc'
  'nvidia-utils'
  'python'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
provides=(
  'audio.cpp'
  'audio.cpp-cuda'
)
conflicts=('audio.cpp')
options=(lto !debug)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  if [[ -z "${NVCC_CCBIN:-}" ]]; then
    source /etc/profile
  fi

  local _cuda_architectures="${AUDIOCPP_CUDA_ARCHITECTURES:-}"
  local _cmake_options=(
    -S "${srcdir}/${_pkgname}"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DENGINE_ENABLE_CUDA=ON
    -DENGINE_ENABLE_HIP=OFF
    -DENGINE_ENABLE_VULKAN=OFF
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DAUDIOCPP_DEPLOYMENT_BUILD=ON
    -DAUDIOCPP_BUILD_NATIVE_MODEL_MANAGER=ON
  )

  # Match llama.cpp-cuda's CI behavior: GitHub Actions runners generally have
  # no visible GPU, so disable host-native CPU code and build the complete set
  # of dynamically selected CPU backends. Unlike ggml's default-only path,
  # audio.cpp's own CUDA sources also need an explicit non-native architecture
  # list on a GPU-less runner.
  if [[ -n "${CI:-}" && "${CI}" != 0 ]]; then
    echo "CI = ${CI} detected, building universal package"
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=ON
      -DENGINE_ENABLE_NATIVE_CPU=OFF
    )
    if [[ -z "${_cuda_architectures}" ]]; then
      _cuda_architectures='75-virtual;80-virtual;86-real;89-real;120a-real;121a-real'
    fi
  else
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=OFF
      -DENGINE_ENABLE_NATIVE_CPU=ON
    )
  fi

  if [[ -n "${_cuda_architectures}" ]]; then
    _cmake_options+=(
      "-DCMAKE_CUDA_ARCHITECTURES=${_cuda_architectures}"
    )
  fi

  # Allow CI workflows and local builders to append project-specific CMake
  # options without maintaining a second PKGBUILD.
  if [[ -n "${AUDIOCPP_BUILD_EXTRA_ARGS:-}" ]]; then
    echo "Applied custom CMake build args: ${AUDIOCPP_BUILD_EXTRA_ARGS}"
    # shellcheck disable=SC2206
    _cmake_options+=(${AUDIOCPP_BUILD_EXTRA_ARGS})
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build --parallel "$(nproc)" --target \
    audiocpp_cli \
    audiocpp_server \
    audiocpp_gguf
}

package() {
  # Universal CI builds produce private shared ggml/backend libraries, while
  # local native builds are static. Keep executables in the same private
  # directory in both cases: their $ORIGIN RPATH then finds CI libraries without
  # exposing audio.cpp's incompatible ggml through /usr/lib.
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm755 \
    build/bin/audiocpp_cli \
    build/bin/audiocpp_server \
    build/bin/audiocpp_gguf \
    -t "${pkgdir}/usr/lib/${_pkgname}"
  for _binary in audiocpp_cli audiocpp_server audiocpp_gguf; do
    ln -s "../lib/${_pkgname}/${_binary}" "${pkgdir}/usr/bin/${_binary}"
  done

  if compgen -G 'build/bin/*.so*' >/dev/null; then
    cp -a build/bin/*.so* "${pkgdir}/usr/lib/${_pkgname}/"
  fi

  # Keep the script and catalog in the same relative layout expected by the
  # model manager, then expose a convenient command through /usr/bin.
  install -Dm755 "${srcdir}/${_pkgname}/tools/model_manager_v2.py" \
    "${pkgdir}/usr/share/${_pkgname}/tools/model_manager_v2.py"
  cp -a "${srcdir}/${_pkgname}/model_specs" \
    "${pkgdir}/usr/share/${_pkgname}/model_specs"
  ln -s "../share/${_pkgname}/tools/model_manager_v2.py" \
    "${pkgdir}/usr/bin/audiocpp_model_manager"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cp -a "${srcdir}/${_pkgname}/docs" \
    "${pkgdir}/usr/share/doc/${_pkgname}/docs"
}
