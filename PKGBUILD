# Maintainer: redxherring
# Update instructions (stolen from aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=open-webui-desktop-bin):
#   1. Update pkgver to the new version
#   2. Update sha512sums_x86_64 (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)
_pkgname=radiance-inference
pkgname=${_pkgname}-git
pkgver=1.10.0.r0
pkgrel=1
pkgdesc="C++20 LLM inference server for AMD GPUs (primarily gfx1201) with OpenAI-compatible HTTP API (git HEAD)"
arch=('x86_64')
url="https://codeberg.org/StillDeadcode/radiance"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'rocm-gfx120x-bin')
makedepends=('git' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/radiance/radiance.conf')
install=${pkgname}.install
options=('!lto' '!debug')
source=("${_pkgname}::git+${url}.git#branch=main"
        radiance.service
        radiance.conf)
sha256sums=('SKIP' 'cf695b19ebdc371c8894710ea0dea831507ac4618aaeb7d5b458f14d4cb35b3a' '9aaea1f8692a1098414cf97db6d7248b026894eaa1e37f4d692cdce2e08d10a8')

# Edit for other hardware: run `offload-arch`.
_hip_archs='gfx1201'
# VOPD pairing arm for the shadow-toolchain A/B: OFF or ON. Flip with the pkgrel bump.
_rad_vopd='ON'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if _ver=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null); then
    echo "${_ver}" | sed 's/^v//;s/-\([0-9]\+\)-g.*/.r\1/'
  else
    _basever=$(grep -m1 '^project(' CMakeLists.txt | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    printf "%s.r%s" "${_basever}" "$(git rev-list --count HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  # Shadow toolchain (Path 2 same-dylib A/B, 2026-10-18): both arms MUST compile with the
  # user-space patched libLLVM in $TC/lib so pairing ON/OFF is the only difference. Dies if
  # missing or built for a different clang commit (ROCm update => marker rev mismatch).
  local TC="${RAD_VOPD_TOOLCHAIN:-$HOME/radiance-toolchain}"
  local rev; rev=$(/opt/rocm/lib/llvm/bin/clang --version | sed -n 's|.*ROCm/llvm-project.git \([0-9a-f]\{40\}\).*|\1|p')
  [[ -f "$TC/lib/.vopd-patched" && "$(cat "$TC/lib/.vopd-patched")" == "$rev"* ]] \
    || die "shadow toolchain missing/stale: $TC/lib not marked for clang rev $rev (rebuild it after ROCm updates)"
  # Scope the shadow env to the HIP compiler via a launcher (2026-10-20): a global
  # LD_LIBRARY_PATH makes /usr/bin/ld resolve libamd_comgr's libLLVM.so.24.0git dep
  # against the patched copy, which re-exports none of the libstdc++ symbols stock
  # ROCm leaks under LLVM_24.0 — v1.10.0's r4d_selftest links comgr, so the whole
  # build died in build() (makepkg exit 4). GCC host compiles never need the patch.
  local launcher="${srcdir}/rad-shadow-launch"
  printf '#!/bin/sh\nLD_LIBRARY_PATH="%s${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" exec "$@"\n' \
    "$TC/lib/" > "$launcher"
  chmod +x "$launcher"
  msg2 "shadow libLLVM active: $TC/lib (rev ${rev:0:12}, pairing=${_rad_vopd}, launcher-scoped)"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_HIP_COMPILER_LAUNCHER="$launcher" \
    -DRAD_WITH_HIP=ON \
    -DRAD_GPU_TARGETS="${_hip_archs}" \
    -DRAD_WITH_FFMPEG=ON \
    -DRAD_BUILD_TESTS=OFF \
    -DRAD_HIP_VOPD_REPEATABLE="${_rad_vopd}"
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  # upstream install rules miss data/recipes/*.recipe (Dockerfile lines 113-114 replicate this)
  install -d "${pkgdir}/usr/share/radiance/recipes"
  install -m644 data/recipes/*.recipe -t "${pkgdir}/usr/share/radiance/recipes/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  install -Dm644 "${srcdir}/radiance.service" "${pkgdir}/usr/lib/systemd/system/radiance.service"
  install -Dm644 "${srcdir}/radiance.conf"    "${pkgdir}/etc/radiance/radiance.conf"
}
