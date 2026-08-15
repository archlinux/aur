# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=audio.cpp-hip-git
_pkgname=audio.cpp
pkgver=r357.df6e948
pkgrel=1
pkgdesc='All-in-one C++ audio inference engine on ggml with AMD ROCm/HIP support (git version)'
arch=('x86_64')
url='https://github.com/0xShug0/audio.cpp'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'hip-runtime-amd'
  'hipblas'
  'python'
  'rocblas'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'rocm-hip-sdk'
)
provides=(
  'audio.cpp'
  'audio.cpp-hip'
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
  # Follow llama.cpp-hip's ROCm environment setup. hipconfig handles both the
  # official /opt/rocm layout and compatible alternative ROCm packages.
  if [[ -z "${ROCM_PATH:-}" ]]; then
    source /etc/profile
  fi
  export ROCM_PATH="${ROCM_PATH:-/opt/rocm}"
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/clang"
  export HIP_PLATFORM=amd

  local _gpu_targets="${AUDIOCPP_HIP_TARGETS:-}"
  local _cmake_options=(
    -S "${srcdir}/${_pkgname}"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    "-DCMAKE_HIP_COMPILER=${HIPCXX}"
    "-DCMAKE_HIP_FLAGS=-mllvm --amdgpu-unroll-threshold-local=600"
    -DENGINE_ENABLE_CUDA=OFF
    -DENGINE_ENABLE_HIP=ON
    -DENGINE_ENABLE_VULKAN=OFF
    -DENGINE_ENABLE_CUDA_GRAPHS=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DHIP_PLATFORM=amd
    -DAUDIOCPP_DEPLOYMENT_BUILD=ON
  )

  # Keep this in sync with the universal target list used by llama.cpp-hip.
  # GitHub Actions runners have no AMD GPU, so CI must never depend on runtime
  # GPU detection.
  if [[ -n "${CI:-}" && "${CI}" != 0 ]]; then
    echo "CI = ${CI} detected, building universal package"
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=ON
      -DENGINE_ENABLE_NATIVE_CPU=OFF
    )
    if [[ -z "${_gpu_targets}" ]]; then
      _gpu_targets='gfx906;gfx1010;gfx1030;gfx1031;gfx1100;gfx1101;gfx1102;gfx1151;gfx1200;gfx1201'
    fi
  else
    _cmake_options+=(
      -DENGINE_ENABLE_CPU_ALL_VARIANTS=OFF
      -DENGINE_ENABLE_NATIVE_CPU=ON
    )

    if [[ -z "${_gpu_targets}" ]]; then
      local _amdgpu_arch=''
      local _rocminfo=''
      if [[ -x "${ROCM_PATH}/bin/amdgpu-arch" ]]; then
        _amdgpu_arch="${ROCM_PATH}/bin/amdgpu-arch"
      elif [[ -x "${ROCM_PATH}/lib/llvm/bin/amdgpu-arch" ]]; then
        _amdgpu_arch="${ROCM_PATH}/lib/llvm/bin/amdgpu-arch"
      elif command -v amdgpu-arch >/dev/null 2>&1; then
        _amdgpu_arch="$(command -v amdgpu-arch)"
      fi
      if [[ -n "${_amdgpu_arch}" ]]; then
        _gpu_targets="$("${_amdgpu_arch}" 2>/dev/null | grep -xE 'gfx[0-9a-f]{3,}' | sort -u | paste -sd ';' -)"
      fi

      if [[ -z "${_gpu_targets}" ]]; then
        if [[ -x "${ROCM_PATH}/bin/rocminfo" ]]; then
          _rocminfo="${ROCM_PATH}/bin/rocminfo"
        elif command -v rocminfo >/dev/null 2>&1; then
          _rocminfo="$(command -v rocminfo)"
        fi
        if [[ -n "${_rocminfo}" ]]; then
          _gpu_targets="$("${_rocminfo}" 2>/dev/null \
            | grep -E '^[[:space:]]+Name:[[:space:]]+gfx[0-9a-f]{3,}[[:space:]]*$' \
            | grep -oE 'gfx[0-9a-f]{3,}' \
            | sort -u \
            | paste -sd ';' -)"
        fi
      fi
    fi
  fi

  _gpu_targets="${_gpu_targets//,/;}"
  if [[ -z "${_gpu_targets}" ]]; then
    printf '%s\n' \
      'Could not detect an AMD GPU target.' \
      'Set AUDIOCPP_HIP_TARGETS explicitly, for example: AUDIOCPP_HIP_TARGETS=gfx1100 makepkg' \
      >&2
    return 1
  fi
  _cmake_options+=("-DGPU_TARGETS=${_gpu_targets}")

  # Enable the upstream's target-specific, validated gfx1151 path only for a
  # single-target Strix Halo build.
  if [[ "${_gpu_targets}" == 'gfx1151' ]]; then
    msg2 "Strix Halo optimizations enabled"
    _cmake_options+=(
      -DENGINE_HIP_STRIX_HALO_OPTIMIZATIONS=ON
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
  # ENGINE_ENABLE_CPU_ALL_VARIANTS makes CI builds shared and enables dynamic
  # backend loading. Install those private libraries beside the executables so
  # their $ORIGIN RPATH works without colliding with the system ggml package.
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
