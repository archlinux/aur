# Maintainer: redxherring
# Update instructions (stolen from aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=open-webui-desktop-bin):
#   1. Update pkgver to the new version
#   2. Update sha512sums_x86_64 (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)
_pkgname=radiance-inference
pkgname=${_pkgname}-git
pkgver=2.2.0.r1099
# pkgrel 2: ships the 12-patch scheduler-governance series on base b6b8751c
# ("radiance 2.2.0"): 0001-0003 "head-class governance" (prefill-interleave:
# head — each step governed by the oldest active request's class), 0004 a
# head-mode steps_held_decode undercount fix found by live load testing,
# 0005-0007 "cohort-epoch governance" (prefill-interleave: epoch — the oldest
# active request's class governs until every same-class request present at
# epoch start finishes that phase; preemption revokes cohort membership), and
# 0008-0010 the epoch cohort JOIN WINDOW (requests created within 5 s of
# epoch formation join the cohort with full membership), and 0011-0012 make
# that window SYMMETRIC — [formation − 5 s, formation + 5 s] — with the
# pre-formation side cut-only (only rows the formation froze on the other
# class may join, once they flip into the epoch's class). NB: makepkg runs
# prepare() BEFORE pkgver(), so pkgver carries the +12 patch commits
# (r1099 = 1087 on main + 12); and when upstream moves, makepkg's
# pkgver rewrite resets pkgrel to 1 — re-set it to 2 on rebuilds so
# `pacman -Q` keeps distinguishing the patched build. Patches touch no build
# files (core/sched/config/server-metrics + tests + docs only), so the VOPD
# logic below is unaffected.
pkgrel=2
pkgdesc="C++20 LLM inference server for AMD GPUs (primarily gfx1201) with OpenAI-compatible HTTP API (git HEAD)"
arch=('x86_64')
url="https://codeberg.org/StillDeadcode/radiance"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'rocm-gfx120x-bin' 'openblas')
makedepends=('git' 'cmake' 'ninja' 'openblas')
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
        radiance.env
        0001-sched-prefill-interleave-head-mode-oldest-request-cl.patch
        0002-tests-head-mode-governance-coverage.patch
        0003-docs-document-prefill-interleave-head.patch
        0004-sched-head-mode-steps_held_decode-counts-the-frozen-.patch
        0005-sched-prefill-interleave-epoch-mode-cohort-epoch-gov.patch
        0006-tests-epoch-governance-coverage.patch
        0007-docs-document-prefill-interleave-epoch.patch
        0008-sched-epoch-cohort-join-window-arrivals-within-5-s-o.patch
        0009-tests-epoch-join-window-coverage.patch
        0010-docs-document-the-epoch-cohort-join-window.patch
        0011-sched-symmetric-epoch-cohort-join-window-the-pre-for.patch
        0012-docs-document-the-symmetric-epoch-join-window-and-th.patch)
sha256sums=('SKIP'
            'c903669f221faea09545b70525f780001d73648c66cfc472ac9b23df23956400'
            'cc76ea474ab22a0a2ef24a00c1dbb936df444c83c522ebcd667fd0eafce49112'
            'a0310c047f107a493c275e5e92b896785238f8dbcc5319efca86ac537885c3ac'
            'ff769d39bb82fe419ec3694e1f8beebadd6dcc1a602e3f7cf7969527ea347c18'
            'd33d9f9cb9b7623528f93ed15fbfb3c88bae1c6e193bcf206fc59b54c537f678'
            'dbcf0099b44df7f8a82f18b745e9f5c39fd9a63c032127d6b2b4f58f617d6de2'
            'aaa09367edce9a1d536cfcd1678efe2f446b2e2d9edb2b8561473c11efe05b32'
            '1b383f08e53ce9147441971084a6c489c5116ca9e371ff7fd64af8048d4109a7'
            '959716d3ced50db15d60637dea7a9ff325de6572fe4b1110b367af9f8319b413'
            'ae7b6f818ad65d03064cae61c7eb818813069a84aef397fd7122935cd1b5f1c8'
            'e8049113a9f994c3386ef6d21a6e3fe440ebc25f891492a9271c335b427684af'
            '3c5b56023b51a0ffe39faeb7fc9aee9dfe1f7c8ae4728018f7b35d48a4db86f1'
            '43dc59a9d51d6968b9ed6af322e40924f45392bafd13fe35bcaf39a0b76098d2'
            '4b830dcfcff7a636ad02121d08df8b3b76dfc82bca74d5cf1e1dbf7699e13070'
            '16c9167c5570c5e12af8f1305d0fe0ca02afd6251a90713a6d87d70914550479')

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

prepare() {
  cd "${srcdir}/${_pkgname}"
  # git am needs an identity for the merge commits --3way may produce.
  git config user.email "packaging@localhost"
  git config user.name "makepkg"
  # The 00??-*.patch files live beside the PKGBUILD, NOT in a patches/ subdir:
  # makepkg strips any directory prefix from local source entries (get_filename
  # keeps only the basename) and resolves them against $startdir/$SRCDEST only,
  # so a "patches/..." entry fails with "not found in the build directory".
  # They are staged into $srcdir by basename. Applied explicitly in order;
  # loud failure on upstream drift is intended — no fallbacks: a conflict
  # means the series no longer matches main and must be rebased in the dev
  # clone, not papered over here.
  git am --3way "${srcdir}"/0001-*.patch "${srcdir}"/0002-*.patch "${srcdir}"/0003-*.patch \
              "${srcdir}"/0004-*.patch "${srcdir}"/0005-*.patch "${srcdir}"/0006-*.patch \
              "${srcdir}"/0007-*.patch "${srcdir}"/0008-*.patch "${srcdir}"/0009-*.patch \
              "${srcdir}"/0010-*.patch \
              "${srcdir}"/0011-*.patch "${srcdir}"/0012-*.patch
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
