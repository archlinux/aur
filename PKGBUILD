# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

# -release-git: tracks upstream release tag cadence from a git source.
# pkgver() derives the version from the latest v* tag; prepare() checks out that tag.

_pkgname=crispasr
_reponame=CrispASR

pkgname=${_pkgname}-release-git
pkgver=0.8.3
pkgrel=1
pkgdesc='C++ ggml runtime hub for ASR (fork of whisper.cpp) — Vulkan build, tracks latest release tag'
arch=('x86_64')
url="https://github.com/CrispStrobe/${_reponame}"
license=('MIT')

# Build configuration (env overrides, all prefixed CRISPASR_)
# ---------------------------------------------------------------
# GPU backends — opt-in via env; Vulkan on by default (lowest friction GPU path).
_vulkan=${CRISPASR_GGML_VULKAN:-ON}
_cuda=${CRISPASR_GGML_CUDA:-OFF}
_hip=${CRISPASR_GGML_HIP:-OFF}
# GGML_NATIVE=ON compiles with -march=native, optimising for the build host's
# CPU. AUR packages are source-built and run on the same machine, so this is
# correct by default. Set CRISPASR_GGML_NATIVE=OFF (e.g. for a CI build or
# when building for a different CPU than the build host) to target the
# portable x86-64 baseline instead.
_native=${CRISPASR_GGML_NATIVE:-ON}

# Assemble extra CMake args from backend toggles.
_cmake_extra=()
[[ "$_vulkan" == ON ]] && _cmake_extra+=(-DGGML_VULKAN=ON)
[[ "$_cuda"   == ON ]] && _cmake_extra+=(-DGGML_CUDA=ON)
[[ "$_hip"    == ON ]] && _cmake_extra+=(-DGGML_HIP=ON)

makedepends=('cmake' 'git')
# Vulkan SDK — only needed when Vulkan backend is enabled.
[[ "$_vulkan" == ON ]] && makedepends+=('shaderc' 'spirv-headers')
# CUDA — only needed when user opts in.
[[ "$_cuda"   == ON ]] && makedepends+=('cuda')
# HIP/ROCm — only needed when user opts in.
[[ "$_hip"    == ON ]] && makedepends+=('rocm-hip-runtime')

# Runtime deps — OpenMP is always compiled in via the linux preset.
depends=('libgomp')
# Vulkan loader — only needed when Vulkan backend is enabled.
[[ "$_vulkan" == ON ]] && depends+=('vulkan-icd-loader')

# Runtime deps for GPU backends — optional since binaries work on CPU alone.
optdepends=(
  'vulkan-radeon: AMD GPU support (Mesa/RADV)'
  'vulkan-intel: Intel GPU support (Mesa/anv)'
  'nvidia-utils: NVIDIA GPU support (proprietary Vulkan ICD)'
  'cuda: CUDA backend runtime'
  'rocm-hip-runtime: HIP/ROCm backend runtime'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("${pkgname}::git+https://github.com/CrispStrobe/${_reponame}.git"
        "fix-opusfile-include-dirs.patch")
sha256sums=('SKIP'
            'ab16165e72297bfcb9117a09a7014e792a6633bc56612086a1ff17307035cde1')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "$srcdir/${pkgname}"
  git reset --hard "v${pkgver}"
  patch -p1 < "${srcdir}/fix-opusfile-include-dirs.patch"
}

build() {
  cd "$srcdir/${pkgname}"
  # --preset linux: Release + OpenMP (per upstream CMakePresets.json).
  # BUILD_SHARED_LIBS=OFF: static linking (avoids insecure RUNPATH issues).
  # GGML_NATIVE: -march=native when ON (optimise for build host), OFF targets
  #   the portable x86-64 baseline.
  # -ffile-prefix-map strips the absolute build path from __FILE__ macros
  #   (reproducible, avoids makepkg's $srcdir-reference warning).
  # _cmake_extra: GPU backend flags (Vulkan by default; CUDA/HIP opt-in via env).
  CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=." \
  CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." \
  cmake --preset linux \
    -DBUILD_SHARED_LIBS=OFF \
    -DGGML_NATIVE="${_native}" \
    "${_cmake_extra[@]}"
  # Only use half the cores to build (upstream grinds on all)
  cmake --build build -j$(( $(nproc 2>/dev/null || echo 2) / 2 ))
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 "build/bin/${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "build/bin/${_pkgname}-quantize" "${pkgdir}/usr/bin/${_pkgname}-quantize"
  install -Dm755 "build/bin/${_pkgname}-diff"     "${pkgdir}/usr/bin/${_pkgname}-diff"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD: