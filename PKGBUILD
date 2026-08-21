# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=audio.cpp-vulkan-git
_pkgname=audio.cpp
pkgver=r424.5fda891
pkgrel=1
pkgdesc='All-in-one C++ audio inference engine on ggml with Vulkan GPU support (git version)'
arch=('x86_64')
url='https://github.com/0xShug0/audio.cpp'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'python'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'shaderc'
  'spirv-headers'
  'vulkan-headers'
)
provides=(
  'audio.cpp'
  'audio.cpp-vulkan'
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
  local _cmake_options=(
    -S "${srcdir}/${_pkgname}"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DENGINE_ENABLE_CUDA=OFF
    -DENGINE_ENABLE_HIP=OFF
    -DENGINE_ENABLE_VULKAN=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DAUDIOCPP_DEPLOYMENT_BUILD=ON
    -DAUDIOCPP_BUILD_NATIVE_MODEL_MANAGER=ON
  )

  # Follow llama.cpp-vulkan's CI behavior: build every dynamically selected
  # CPU backend and avoid host-native instructions on GitHub Actions runners.
  if [[ -n "${CI:-}" && "${CI}" != 0 ]]; then
    echo "CI = ${CI} detected, building universal package"
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=ON
      -DENGINE_ENABLE_NATIVE_CPU=OFF
    )
  else
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=OFF
      -DENGINE_ENABLE_NATIVE_CPU=ON
    )
  fi

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
  # local native builds are static. Keep them beside the executables so their
  # $ORIGIN RPATH and dynamic backend discovery work without exposing an
  # incompatible libggml through /usr/lib.
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
