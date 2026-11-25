# Maintainer: redxherring
# Update instructions (stolen from aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=open-webui-desktop-bin):
#   1. Update pkgver to the new version
#   2. Update sha512sums_x86_64 (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)
_pkgname=radiance-inference
pkgname=${_pkgname}-git
pkgver=2.2.0.r1087
pkgrel=1
pkgdesc="C++20 LLM inference server for AMD GPUs (primarily gfx1201) with OpenAI-compatible HTTP API (git HEAD)"
arch=('x86_64')
url="https://codeberg.org/StillDeadcode/radiance"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'rocm-hip-runtime' 'openblas')
makedepends=('git' 'cmake' 'ninja' 'openblas' 'rocm-hip-sdk')
optdepends=('curl: hfget.sh model-download helper (/usr/libexec/radiance/hfget.sh)'
            'jq: hfget.sh'
            'python3: rad-export tool (/usr/bin/rad-export)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/radiance/radiance.yaml'
        'etc/radiance/radiance.env')
install=${pkgname}.install
options=('!lto' '!debug')
source=("${_pkgname}::git+${url}.git#branch=main"
        radiance.service
        radiance.yaml
        radiance.env)
sha256sums=('SKIP'
            'c903669f221faea09545b70525f780001d73648c66cfc472ac9b23df23956400'
            'f03e9c85f9540527b2d1a756238fb3dd25c1e4718c78b48eb0e0ef8b3313c9e5'
            'a0310c047f107a493c275e5e92b896785238f8dbcc5319efca86ac537885c3ac')

# Edit for other hardware: run `offload-arch`.
_hip_archs='gfx1201'
# VOPD pairing arm for the shadow-toolchain A/B: OFF or ON. Flip with the pkgrel bump.
_rad_vopd='ON'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Upstream tags are stale (newest is v1.3.0; releases are "radiance X.Y.Z" commits),
  # so git describe regresses below the 1.x pkgver shipped pre-2.0.0 (v1.3.0-843 at
  # the 2.0.0 commit reads as a downgrade). Derive from the project() version, which
  # upstream bumps per release (2.0.0 at ddcb9c6), plus the commit count.
  _basever=$(grep -m1 '^project(' CMakeLists.txt | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
  printf "%s.r%s" "${_basever}" "$(git rev-list --count HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # Shadow toolchain (Path 2 same-dylib A/B, 2026-10-18): both arms MUST compile with the
  # user-space patched libLLVM in $TC/lib so pairing ON/OFF is the only difference. The
  # marker records the clang commit it was patched for; a ROCm update revs clang and
  # stales the marker.
  #
  # Fallback, not death (2026-11-19): the toolchain is a maintainer-side VOPD A/B rig,
  # NOT buildable-from-scratch content of this package, and stock clang is what every
  # non-maintainer user has. Marker missing/stale (e.g. ROCm just updated, or a foreign
  # box): warn and build stock (pairing OFF, upstream default) instead of aborting.
  # Marker fresh: strict patched-toolchain arm, pairing per _rad_vopd.
  # NB: makepkg has no `die` (removed in pacman 7) — an abort here is error + return 1.
  local TC="${RAD_VOPD_TOOLCHAIN:-$HOME/radiance-toolchain}"
  local rev; rev=$(/opt/rocm/lib/llvm/bin/clang --version | sed -n 's|.*ROCm/llvm-project.git \([0-9a-f]\{40\}\).*|\1|p')
  local -a vopd_opts=(-DRAD_HIP_VOPD_REPEATABLE="${_rad_vopd}")
  local launcher=""
  if [[ -f "$TC/lib/.vopd-patched" && "$(cat "$TC/lib/.vopd-patched")" == "$rev"* ]]; then
    # Scope the shadow env to the HIP compiler via a launcher (2026-10-20): a global
    # LD_LIBRARY_PATH makes /usr/bin/ld resolve libamd_comgr's libLLVM.so.24.0git dep
    # against the patched copy, which re-exports none of the libstdc++ symbols stock
    # ROCm leaks under LLVM_24.0 — v1.10.0's r4d_selftest links comgr, so the whole
    # build died in build() (makepkg exit 4). GCC host compiles never need the patch.
    launcher="${srcdir}/rad-shadow-launch"
    printf '#!/bin/sh\nLD_LIBRARY_PATH="%s${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" exec "$@"\n' \
      "$TC/lib/" > "$launcher"
    chmod +x "$launcher"
    msg2 "shadow libLLVM active: $TC/lib (rev ${rev:0:12}, pairing=${_rad_vopd}, launcher-scoped)"
  else
    warning "shadow toolchain missing/stale: $TC/lib not marked for clang rev ${rev:0:12}"
    warning "  (rebuilt after each ROCm update); building with stock ROCm clang, pairing OFF."
    vopd_opts=(-DRAD_HIP_VOPD_REPEATABLE=OFF)
  fi
  local -a launcher_opts=()
  [[ -n "$launcher" ]] && launcher_opts=(-DCMAKE_HIP_COMPILER_LAUNCHER="$launcher")
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${launcher_opts[@]}" \
    -DRAD_WITH_HIP=ON \
    -DRAD_GPU_TARGETS="${_hip_archs}" \
    -DRAD_WITH_FFMPEG=ON \
    -DRAD_BUILD_TESTS=OFF \
    "${vopd_opts[@]}"
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  # upstream install rules miss data/recipes/*.recipe (Dockerfile lines 204-205 replicate this)
  install -d "${pkgdir}/usr/share/radiance/recipes"
  install -m644 data/recipes/*.recipe -t "${pkgdir}/usr/share/radiance/recipes/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  install -Dm644 "${srcdir}/radiance.service" "${pkgdir}/usr/lib/systemd/system/radiance.service"
  # 2.0.0: the server reads all settings from radiance.yaml (CLI flags are refused).
  # The YAML ships 0644 - with server.api-key-env it carries no secret. radiance.env
  # is the single 0600 EnvironmentFile: the API key plus the optional engine knobs,
  # so it ships root-only: 0644 would leak the key to every local user. The unit has
  # no User= and PID 1 reads EnvironmentFile as root, so 0600 costs nothing. -D would
  # create /etc/radiance 0755; create it first at 0750 so the directory is not
  # traversable either.
  install -d -m750 "${pkgdir}/etc/radiance"
  install -Dm644 "${srcdir}/radiance.yaml"    "${pkgdir}/etc/radiance/radiance.yaml"
  install -Dm600 "${srcdir}/radiance.env"     "${pkgdir}/etc/radiance/radiance.env"
  # /srv/models/rad: our server.download-dir and upstream's model dir (README:77).
  # ReadWritePaths= needs it to exist (it does not create paths); hfget.sh mkdir -p's
  # below it. The service runs as root (no User=), so root:root; 0755 - published
  # weights are public and UMask=0077 makes fetched files root-only anyway.
  install -d -m755 "${pkgdir}/srv/models/rad"
}
