# Maintainer: monsoon <monsoon235@users.noreply.aur.archlinux.org>
pkgname=strata-rocm
pkgver=0.1.42
pkgrel=1
pkgdesc="Run server-grade frontier models on consumer GPUs powered by Niko1221's dynamic sparse router offloading (AMD ROCm version)"
arch=('x86_64')
url='https://github.com/Niko1221/Strata'
license=('MIT')
options=('!lto')
depends=('hip-runtime-amd' 'hipblas' 'hipblaslt')
makedepends=('cmake' 'hipblaslt' 'rocminfo' 'rocm-llvm')
provides=('strata')
conflicts=('strata')
_ggml_commit='3cf03257f219afbe7334045ff7c6a06ac68c627d'
source=(
  "strata-${pkgver}.tar.gz::https://github.com/Niko1221/Strata/archive/refs/tags/v${pkgver}.tar.gz"
  "llama.cpp-${_ggml_commit}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/${_ggml_commit}.tar.gz"
)
sha256sums=(
  '6feefd456c9e0331d1d0486861a9114b77d357e2fcb1959bd3e47e2adb49d84d'
  'c076d7534afa0e5d0ec2a0d425b11e791c16f3de0d727221aea071cef156a280'
)

build() {
  local archs="${STRATA_HIP_ARCHS:-}"
  if [[ -z "$archs" ]]; then
    mapfile -t detected < <(
      /opt/rocm/bin/rocminfo 2>/dev/null \
        | awk '
            /^[[:space:]]*Agent [0-9]+/ {
              emit_agent()
              name = ""
              type = ""
            }
            /^[[:space:]]*Name:[[:space:]]+gfx[^[:space:]]+/ { name = $2 }
            /^[[:space:]]*Device Type:[[:space:]]+GPU/ { type = "GPU" }
            function emit_agent() {
              if (type == "GPU" && name != "") print name
            }
            END { emit_agent() }
          ' \
        | sort -u
    )
    if (( ${#detected[@]} > 0 )); then
      archs="$(IFS=';'; printf '%s' "${detected[*]}")"
    fi
  fi
  archs="${archs//,/;}"

  export PATH="/opt/rocm/bin:/opt/rocm/llvm/bin:${PATH}"
  export HIP_PATH=/opt/rocm
  local c_compiler=/usr/bin/cc
  local cxx_compiler=/usr/bin/c++
  local -a backend_args=(-DSTRATA_ENABLE_HIP=ON -DSTRATA_ENABLE_CUDA=OFF)
  local gfx906="${STRATA_HIP_GFX906:-}"
  if [[ "${gfx906,,}" == 'on' || "$gfx906" == '1' ]]; then
    c_compiler=/opt/rocm/llvm/bin/clang
    cxx_compiler=/opt/rocm/llvm/bin/clang++
    backend_args=(-DSTRATA_HIP_GFX906=ON -DSTRATA_ENABLE_HIP=OFF)
  fi
  local -a cmake_args=(
    -DCMAKE_BUILD_TYPE=Release
    "-DCMAKE_C_COMPILER=${c_compiler}"
    "-DCMAKE_CXX_COMPILER=${cxx_compiler}"
    -DCMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++
    -DCMAKE_HIP_COMPILER_ROCM_ROOT=/opt/rocm
    -DCMAKE_PREFIX_PATH=/opt/rocm
    "${backend_args[@]}"
    "-DSTRATA_GGML_DIR=${srcdir}/llama.cpp-${_ggml_commit}"
  )
  if [[ -n "$archs" ]]; then
    cmake_args+=("-DCMAKE_HIP_ARCHITECTURES=${archs}")
  fi
  cmake -S "${srcdir}/Strata-${pkgver}" -B "${srcdir}/build-hip" "${cmake_args[@]}"

  local jobs="${STRATA_BUILD_JOBS:-$(nproc)}"
  [[ "$jobs" =~ ^[1-9][0-9]*$ ]] || { error "Invalid STRATA_BUILD_JOBS: ${jobs}"; return 1; }
  cmake --build "${srcdir}/build-hip" --target strata strata-device --parallel "${jobs}"
}

package() {
  install -Dm755 "${srcdir}/build-hip/strata" "${pkgdir}/usr/bin/strata"
  install -Dm755 "${srcdir}/build-hip/strata-device" "${pkgdir}/usr/bin/strata-device"
  install -Dm644 "${srcdir}/Strata-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/Strata-${pkgver}/docs/AMD_HIP.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/AMD_HIP.md"
}
