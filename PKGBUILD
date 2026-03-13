# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com>
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>
#
# mesa-git + MR !37898 (VK_NVX_binary_import) merged in.
# GPU: Turing (RTX 20xx / GTX 16xx) or newer, drm/nouveau (not nvidia.ko).
# Enable DLSS: DXVK_ENABLE_NVAPI=1 PROTON_ENABLE_NVAPI=1 %command%

pkgname=mesa-git-nvk-dlss
pkgdesc="Mesa git with VK_NVX_binary_import (NVK DLSS support, MR !37898)"
pkgver=1  # filled by pkgver()
pkgrel=1
arch=('x86_64')
makedepends=(
    'git'
    'xorgproto'
    'libxml2'
    'libva'
    'elfutils'
    'libxrandr'
    'meson'
    'ninja'
    'glslang'
    'directx-headers'
    'python-mako'
    'python-ply'
    'cbindgen'
    'wayland-protocols'
    'python-packaging'
    'python-pyaml'
    'llvm'
    'clang'
    'libclc'
    'spirv-llvm-translator'
    'spirv-tools'
    'rust'
    'rust-bindgen'
)
depends=(
    'libdrm'
    'libxxf86vm'
    'libxdamage'
    'libxshmfence'
    'libelf'
    'libunwind'
    'libglvnd'
    'wayland'
    'lm_sensors'
    'vulkan-icd-loader'
    'zstd'
    'expat'
    'gcc-libs'
    'libxfixes'
    'libx11'
    'systemd-libs'
    'libxext'
    'libxcb'
    'glibc'
    'zlib'
    'python'
    'xcb-util-keysyms'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
    'vulkan-mesa-layers'
    'opencl-driver'
    'opengl-driver'
    'vulkan-driver'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-libgl'
    'mesa'
    'mesa-git'
    'vulkan-mesa-device-select'
    'vulkan-mesa-implicit-layers'
    'opencl-rusticl-mesa'
)
conflicts=(
    'vulkan-mesa-layers'
    'opencl-clover-mesa'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-libgl'
    'mesa'
    'mesa-git'
    'vulkan-mesa-device-select'
    'vulkan-mesa-implicit-layers'
    'opencl-rusticl-mesa'
)
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main')
sha256sums=('SKIP')
b2sums=('SKIP')

options=(!lto !debug)

# ---------------------------------------------------------------------------
# MR reference: change this to pick up a newer revision of the MR if it is
# rebased or superseded.  Set to empty string to skip the merge entirely
# (useful when MR lands in main).
# ---------------------------------------------------------------------------
_mr_ref="refs/merge-requests/37898/head"

pkgver() {
    cd mesa
    local _ver
    _ver=$(<VERSION)
    # Format: <mesa-version>.<commit-count>.<short-hash>.nvkdlss
    # The "nvkdlss" suffix makes the version clearly distinct from plain mesa-git
    # and survives across any mesa VERSION bump automatically.
    printf '%s.%s.%s.nvkdlss' \
        "${_ver/-/_}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    if [ -d _build ]; then
        rm -rf _build
    fi

    cd mesa

    git config user.email "makepkg@localhost"
    git config user.name "makepkg"

    # -----------------------------------------------------------------------
    # Step 1: merge MR !37898 — skip if already in history
    # -----------------------------------------------------------------------
    if [ -n "$_mr_ref" ]; then
        echo "==> Fetching MR $_mr_ref ..."
        git fetch origin "$_mr_ref"
        local _mr_head
        _mr_head=$(git rev-parse FETCH_HEAD)

        if git merge-base --is-ancestor "$_mr_head" HEAD; then
            echo "==> MR is already part of mesa main — skipping merge."
        else
            echo "==> Merging MR (commit $_mr_head) into main..."
            # -X theirs: resolve text conflicts in favour of the MR so the
            # build keeps working as mesa evolves around it.
            if ! git merge -X theirs --no-gpg-sign --no-edit FETCH_HEAD; then
                echo "==> Merge failed; attempting to continue with conflicts resolved by 'ours'..."
                git merge --abort 2>/dev/null || true
                git merge -X ours --no-gpg-sign --no-edit FETCH_HEAD
            fi
        fi
    else
        echo "==> _mr_ref is empty — assuming MR is already in main, skipping merge."
    fi

    # -----------------------------------------------------------------------
    # Step 2: nvk_cubin.c — inject ALIGN macro if missing
    # -----------------------------------------------------------------------
    local _cubin="src/nouveau/vulkan/nvk_cubin.c"
    if [ -f "$_cubin" ]; then
        if grep -q 'define ALIGN' "$_cubin"; then
            echo "==> nvk_cubin.c: ALIGN macro already present — skipping."
        else
            echo "==> nvk_cubin.c: injecting ALIGN macro..."
            sed -i '1s|^|#ifndef ALIGN\n#define ALIGN(value, alignment) (((value) + (alignment) - 1) \& ~((alignment) - 1))\n#endif\n|' \
                "$_cubin"
        fi
    else
        echo "==> nvk_cubin.c: file not found — MR may have been refactored, skipping patch."
    fi

    # -----------------------------------------------------------------------
    # Step 3: nvk_cmd_dispatch.c — remove stale printf_buffer_addr field
    # -----------------------------------------------------------------------
    local _dispatch="src/nouveau/vulkan/nvk_cmd_dispatch.c"
    if [ -f "$_dispatch" ]; then
        if grep -q 'printf_buffer_addr' "$_dispatch"; then
            echo "==> nvk_cmd_dispatch.c: removing printf_buffer_addr..."
            sed -i '/printf_buffer_addr/d' "$_dispatch"
        else
            echo "==> nvk_cmd_dispatch.c: printf_buffer_addr not found — already gone or MR updated, skipping."
        fi
    else
        echo "==> nvk_cmd_dispatch.c: file not found — skipping patch."
    fi

    # -----------------------------------------------------------------------
    # Step 4: nak/api.rs — fix max_warps_per_sm signature mismatch
    # -----------------------------------------------------------------------
    local _api_rs="src/nouveau/compiler/nak/api.rs"
    if [ -f "$_api_rs" ]; then
        python3 - << 'PYEOF'
import re, pathlib, sys

p = pathlib.Path('src/nouveau/compiler/nak/api.rs')
s = p.read_text()

# Canonical pattern added by MR !37898 — may drift between MR revisions.
# We try an exact match first, then fall back to a regex that is robust to
# minor whitespace / body changes.
OLD_EXACT = (
    'pub extern "C" fn nak_max_warps_per_sm(num_gprs: u32) -> u32 {\n'
    '    crate::ir::max_warps_per_sm(num_gprs)\n'
    '}'
)
NEW_BODY = (
    'pub extern "C" fn nak_max_warps_per_sm(num_gprs: u32) -> u32 {\n'
    '    let total_regs: u32 = 65536;\n'
    '    let gprs = num_gprs.max(1).next_multiple_of(8);\n'
    '    crate::ir::prev_multiple_of((total_regs / 32) / gprs, 4)\n'
    '}'
)

# Already patched guard: if inlined body is already there, nothing to do.
if 'let total_regs: u32 = 65536' in s:
    print("api.rs: already patched — skipping.")
    sys.exit(0)

if OLD_EXACT in s:
    p.write_text(s.replace(OLD_EXACT, NEW_BODY))
    print("api.rs: patched OK (exact match).")
    sys.exit(0)

# Regex fallback: match the function regardless of body content so we can
# replace it even when the MR has been rebased with minor changes.
pattern = re.compile(
    r'pub extern "C" fn nak_max_warps_per_sm\(num_gprs: u32\) -> u32 \{[^}]+\}',
    re.MULTILINE,
)
m = pattern.search(s)
if m:
    p.write_text(s[:m.start()] + NEW_BODY + s[m.end():])
    print("api.rs: patched OK (regex fallback).")
    sys.exit(0)

# Function not found at all — MR may have been merged/reworked upstream.
print("api.rs: nak_max_warps_per_sm not found — skipping patch (may be fine if MR was reworked).",
      file=sys.stderr)
sys.exit(0)
PYEOF
    else
        echo "==> api.rs: file not found — skipping patch."
    fi
}

build() {
    local meson_options=(
        -D android-libbacktrace=disabled
        -D b_ndebug=true
        -D b_lto=false
        -D egl=enabled
        -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,i915,iris,crocus,zink
        -D gallium-extra-hud=true
        -D gallium-rusticl=true
        -D gallium-va=enabled
        -D gbm=enabled
        -D gles1=disabled
        -D gles2=enabled
        -D glvnd=enabled
        -D glx=dri
        -D libunwind=enabled
        -D llvm=enabled
        -D lmsensors=enabled
        -D microsoft-clc=disabled
        -D platforms=x11,wayland
        -D valgrind=disabled
        -D video-codecs=all
        -D vulkan-drivers=amd,intel,intel_hasvk,swrast,virtio,nouveau
        -D vulkan-layers=device-select,intel-nullhw,overlay,anti-lag
        -D tools=[]
        -D zstd=enabled
        -D buildtype=plain
        --wrap-mode=nofallback
        --force-fallback-for=syn,paste,rustc-hash
        -D prefix=/usr
        -D sysconfdir=/etc
        -D legacy-x11=dri2
    )

    CFLAGS+=' -g1'
    CXXFLAGS+=' -g1'

    meson setup mesa _build "${meson_options[@]}"
    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # Remove the overlay control script; the bin dir will be empty after.
    if [ -f "${pkgdir}/usr/bin/mesa-overlay-control.py" ]; then
        rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    fi
    if [ -d "${pkgdir}/usr/bin" ] && [ -z "$(ls -A "${pkgdir}/usr/bin")" ]; then
        rmdir "${pkgdir}/usr/bin"
    fi

    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

    install -Dm644 "${srcdir}/mesa/docs/license.rst" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
