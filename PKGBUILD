# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

# -release-git: tracks upstream release tag cadence from a git source.
# pkgver() derives the version from the latest v* tag; prepare() checks out that tag.

pkgname=parakeet.cpp-release-git
_pkgname=parakeet.cpp
_repo="mudler/${_pkgname}"
pkgver=0.3.2
pkgrel=1
pkgdesc='C++/ggml inference engine for NVIDIA Parakeet ASR models (latest Git release)'
arch=('x86_64')
url='https://github.com/mudler/parakeet.cpp'
license=('MIT')

# Build configuration (env overrides, all prefixed PARAKEET_CPP_)
# ---------------------------------------------------------------
# Shared libparakeet.so — on by default; OFF produces only static binaries.
_shared=${PARAKEET_CPP_SHARED:-ON}
# GPU backends — opt-in via env; Vulkan on by default (lowest friction GPU path).
_vulkan=${PARAKEET_CPP_GGML_VULKAN:-ON}
_cuda=${PARAKEET_CPP_GGML_CUDA:-OFF}
_hip=${PARAKEET_CPP_GGML_HIP:-OFF}
# GGML_NATIVE=ON compiles with -march=native, optimising for the build host's
# CPU. AUR packages are source-built and run on the same machine, so this is
# correct by default. Set PARAKEET_CPP_GGML_NATIVE=OFF (e.g. for a CI build or
# when building for a different CPU than the build host) to target the
# portable x86-64 baseline instead.
_native=${PARAKEET_CPP_GGML_NATIVE:-ON}

# Assemble extra CMake args from backend toggles.
_cmake_extra=()
[[ "$_vulkan" == ON ]] && _cmake_extra+=(-DPARAKEET_GGML_VULKAN=ON)
[[ "$_cuda"   == ON ]] && _cmake_extra+=(-DPARAKEET_GGML_CUDA=ON)
[[ "$_hip"    == ON ]] && _cmake_extra+=(-DPARAKEET_GGML_HIP=ON)

makedepends=('cmake' 'git')
# Vulkan SDK — only needed when Vulkan backend is enabled.
[[ "$_vulkan" == ON ]] && makedepends+=('vulkan-headers' 'spirv-headers' 'shaderc')
# CUDA — only needed when user opts in.
[[ "$_cuda"   == ON ]] && makedepends+=('cuda')
# HIP/ROCm — only needed when user opts in.
[[ "$_hip"    == ON ]] && makedepends+=('rocm-hip-runtime')

# Runtime deps for GPU backends — optional since binaries work on CPU alone.
# Vulkan loader is a hard DT_NEEDED when _vulkan=ON (the default), so promote
# it to depends in that case. CUDA/HIP remain optdepends (opt-in via env).
if [[ "$_vulkan" == ON ]]; then
  depends=('vulkan-icd-loader')
fi
optdepends=(
  'vulkan-icd-loader: Vulkan backend runtime'
  'cuda: CUDA backend runtime'
  'rocm-hip-runtime: HIP/ROCm backend runtime'
)

provides=("${_pkgname}=${pkgver}" "${_pkgname}-cli=${pkgver}" "${_pkgname}-server=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-cli" "${_pkgname}-server" "${_pkgname}-bin" "${_pkgname}-vulkan-bin-release-git")

source=("${pkgname}::git+https://github.com/${_repo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git tag --list 'v[0-9]*' | sed 's/^v//' | sort -V | tail -1
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # Checkout the latest release tag so the reported version matches the built tree.
  git reset --hard "v${pkgver}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  # BUILD_SHARED_LIBS=OFF folds ggml into libparakeet (matches upstream release bundles).
  # PARAKEET_SHARED=${_shared}: builds libparakeet.so when ON (default), absent when OFF.
  # GGML_NATIVE=${_native}: -march=native when =ON (optimise for build host),
  #   =OFF targets the portable x86-64 baseline.
  # GGML_LTO=ON + CMAKE_INTERPROCEDURAL_OPTIMIZATION=ON: link-time optimisation across
  #   all targets (ggml + parakeet); redundant with makepkg's default lto option but
  #   guarantees LTO even if !lto is set or building outside makepkg.
  # CMAKE_SKIP_RPATH=ON: prevents cmake from embedding the build directory into the
  #   binaries' RUNPATH. Without this, parakeet-cli/server embed
  #   $srcdir/.../build as RUNPATH and only resolve libparakeet.so from there;
  #   the package is then broken off the build host.
  # -ffile-prefix-map strips the absolute build path from __FILE__ macros (reproducible).
  # _cmake_extra: GPU backend flags (Vulkan by default; CUDA/HIP opt-in via env).
  CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=." \
  CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." \
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DPARAKEET_BUILD_TESTS=OFF \
    -DPARAKEET_BUILD_CLI=ON \
    -DPARAKEET_BUILD_SERVER=ON \
    -DPARAKEET_SHARED="${_shared}" \
    -DGGML_NATIVE="${_native}" \
    -DGGML_LTO=ON \
    "${_cmake_extra[@]}"
  # Only use half the cores to build (default was all)
  cmake --build build -j$(( $(nproc 2>/dev/null || echo 2) / 2 ))
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 build/examples/cli/parakeet-cli       "${pkgdir}/usr/bin/parakeet-cli"
  install -Dm755 build/examples/server/parakeet-server "${pkgdir}/usr/bin/parakeet-server"

  install -Dm644 include/parakeet.h      "${pkgdir}/usr/include/parakeet/parakeet.h"
  install -Dm644 include/parakeet_capi.h "${pkgdir}/usr/include/parakeet/parakeet_capi.h"

  # Install shared library if built
  if [[ -f build/libparakeet.so ]]; then
    install -Dm755 build/libparakeet.so "${pkgdir}/usr/lib/libparakeet.so"
  fi

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
