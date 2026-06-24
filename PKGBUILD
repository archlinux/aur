# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

# -release-git: tracks upstream release tag cadence from a git source.
# pkgver() derives the version from the latest v* tag; prepare() checks out
# that tag. Build uses BUILD_SHARED_LIBS=OFF to fold ggml into self-contained
# binaries (matches the upstream release workflow).

pkgname=parakeet.cpp-release-git
_pkgname=parakeet
_upstream=mudler
pkgver=0.3.2
pkgrel=1
pkgdesc='C++/ggml inference engine for NVIDIA Parakeet ASR models (latest Git release)'
arch=('x86_64')
url='https://github.com/mudler/parakeet.cpp'
license=('MIT')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-cli=${pkgver}" "${_pkgname}-server=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-cli" "${_pkgname}-server" "${_pkgname}-bin" "${_pkgname}-bin-release-git")

# GGML_NATIVE=ON compiles with -march=native, optimising for the build host's
# CPU. AUR packages are source-built and run on the same machine, so this is
# correct by default. Set GGML_NATIVE=OFF (e.g. for a CI build or when building
# for a different CPU than the build host) to target the portable AVX2 baseline
# instead. Override at build time: makepkg GGML_NATIVE=OFF.
_native=${GGML_NATIVE:-ON}
source=("${pkgname}::git+https://github.com/${_upstream}/${_pkgname}.cpp.git")
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
  # BUILD_SHARED_LIBS=OFF folds ggml into the binaries (matches upstream release bundles).
  # GGML_NATIVE=${_native}: -march=native when ON (optimise for build host = install host
  #   on AUR source builds); OFF targets the portable AVX2 baseline.
  # GGML_LTO=ON + CMAKE_INTERPROCEDURAL_OPTIMIZATION=ON: link-time optimisation (free perf).
  # -ffile-prefix-map strips the absolute build path from __FILE__ macros (reproducible build).
  CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=." \
  CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." \
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DPARAKEET_BUILD_TESTS=OFF \
    -DPARAKEET_BUILD_CLI=ON \
    -DPARAKEET_BUILD_SERVER=ON \
    -DGGML_NATIVE="${_native}" \
    -DGGML_LTO=ON
  cmake --build build -j"$(nproc)"
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 build/examples/cli/parakeet-cli     "${pkgdir}/usr/bin/parakeet-cli"
  install -Dm755 build/examples/server/parakeet-server "${pkgdir}/usr/bin/parakeet-server"

  install -Dm644 include/parakeet.h      "${pkgdir}/usr/include/parakeet/parakeet.h"
  install -Dm644 include/parakeet_capi.h "${pkgdir}/usr/include/parakeet/parakeet_capi.h"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD: