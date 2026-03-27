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
# mesa-git + MR !37898 (VK_NVX_binary_import / DLSS) merged in.
# + local VK_NV_low_latency2 (Nvidia Reflex) implementation for NVK.
# GPU: Turing (RTX 20xx / GTX 16xx) or newer, drm/nouveau (not nvidia.ko).
#
# Integration patches (applied in prepare(), no sed/awk hackery):
#   nak_api.patch                — fix max_warps_per_sm for MR !37898 ABI
#   nvk_meson_ll2.patch          — add nvk_nv_low_latency2.c to build
#   nvk_physical_device_ll2.patch — advertise NV_low_latency2
#
# Enable DLSS:   DXVK_ENABLE_NVAPI=1 PROTON_ENABLE_NVAPI=1 %command%
# Enable Reflex (D3D12 / VKD3D-Proton >=2.12):
#   Exposed automatically — no extra env vars required beyond the NVAPI ones.
# Enable Reflex (D3D11 / DXVK):
#   Requires the VK_LAYER_DXVK_NVAPI_reflex layer from dxvk-nvapi.
#
# ICD-cache note: after switching between this package and stock mesa run
#   sudo ldconfig
# and optionally clear ~/.cache/mesa_shader_cache so the loader picks up
# the correct driver and extension list.

pkgname=mesa-dlss-reflex-git
pkgdesc="Mesa git with VK_NVX_binary_import (NVK DLSS) + VK_NV_low_latency2 (NVK Reflex)"
pkgver=26.1.0_devel.220433.4f76ecec8be.nvkdlssreflex  # filled by pkgver()
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
source=(
    'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
    'nvk_nv_low_latency2.c'
    'nak_api.patch'
    'nvk_meson_ll2.patch'
    'nvk_physical_device_ll2.patch'
)
b2sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

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
    printf '%s.%s.%s.nvkdlssreflex' \
        "${_ver/-/_}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

# ---------------------------------------------------------------------------
# _apply_patch  <patch-file>  <description>
#
# Applies a git-format patch with --3way so that minor upstream refactors
# (line number drift, neighbouring context changes) are handled by a
# three-way merge rather than a hard failure.  Aborts the build if the
# patch cannot be applied even with --3way.
# ---------------------------------------------------------------------------
_apply_patch() {
    local _patch="$1"
    local _desc="$2"
    echo "==> Applying patch: $_desc"
    if patch -p1 --fuzz=3 --no-backup-if-mismatch < "$srcdir/$_patch"; then
        return 0
    fi
    echo "ERROR: patch '$_patch' failed to apply — aborting." >&2
    return 1
}

prepare() {
    if [ -d _build ]; then
        rm -rf _build
    fi

    cd mesa

    # -----------------------------------------------------------------------
    # Step 1: merge MR !37898 — skip if already in history
    # -----------------------------------------------------------------------
    if [ -n "$_mr_ref" ]; then
        echo "==> Fetching MR $_mr_ref ..."
        git fetch origin "$_mr_ref"
        local _mr_head
        _mr_head=$(git rev-parse FETCH_HEAD)

        if git merge-base --is-ancestor "$_mr_head" HEAD; then
            echo "==> MR already in mesa main — skipping merge."
        else
            echo "==> Merging MR $_mr_head ..."
            if ! git -c user.email="makepkg@localhost" -c user.name="makepkg" \
                    merge -X theirs --no-gpg-sign --no-edit FETCH_HEAD; then
                git merge --abort 2>/dev/null || true
                git -c user.email="makepkg@localhost" -c user.name="makepkg" \
                    merge -X ours --no-gpg-sign --no-edit FETCH_HEAD
            fi
        fi
    else
        echo "==> _mr_ref empty — assuming MR is already in main."
    fi

    # -----------------------------------------------------------------------
    # Step 2: nvk_cubin.c — inject ALIGN macro if missing
    # -----------------------------------------------------------------------
    local _cubin="src/nouveau/vulkan/nvk_cubin.c"
    if [ -f "$_cubin" ] && ! grep -q 'define ALIGN' "$_cubin"; then
        echo "==> nvk_cubin.c: injecting ALIGN macro..."
        sed -i '1s|^|#ifndef ALIGN\n#define ALIGN(v, a) (((v) + (a) - 1) \& ~((a) - 1))\n#endif\n|' \
            "$_cubin"
    fi

    # -----------------------------------------------------------------------
    # Step 3: nvk_cmd_dispatch.c — remove stale printf_buffer_addr field
    # -----------------------------------------------------------------------
    local _dispatch="src/nouveau/vulkan/nvk_cmd_dispatch.c"
    if [ -f "$_dispatch" ]; then
        sed -i '/printf_buffer_addr/d' "$_dispatch"
    fi

    # -----------------------------------------------------------------------
    # Step 4: nak/api.rs — fix max_warps_per_sm signature mismatch
    # -----------------------------------------------------------------------
    local _api="src/nouveau/compiler/nak/api.rs"
    if [ -f "$_api" ] && ! grep -q 'let total_regs: u32 = 65536' "$_api"; then
        _apply_patch nak_api.patch "nak: fix max_warps_per_sm for MR !37898 ABI"
    fi

    # -----------------------------------------------------------------------
    # Step 5: install nvk_nv_low_latency2.c
    # -----------------------------------------------------------------------
    echo "==> Installing nvk_nv_low_latency2.c..."
    cp "$srcdir/nvk_nv_low_latency2.c" src/nouveau/vulkan/nvk_nv_low_latency2.c

    # -----------------------------------------------------------------------
    # Step 6: add nvk_nv_low_latency2.c to NVK's meson.build
    # -----------------------------------------------------------------------
    if ! grep -q 'nvk_nv_low_latency2\.c' src/nouveau/vulkan/meson.build; then
        _apply_patch nvk_meson_ll2.patch "meson: add nvk_nv_low_latency2.c to NVK sources"
    else
        echo "==> meson.build: nvk_nv_low_latency2.c already listed — skipping."
    fi

    # -----------------------------------------------------------------------
    # Step 7: advertise VK_NV_low_latency2 in nvk_physical_device.c
    # -----------------------------------------------------------------------
    if ! grep -q 'NV_low_latency2' src/nouveau/vulkan/nvk_physical_device.c; then
        _apply_patch nvk_physical_device_ll2.patch \
            "nvk_physical_device: advertise VK_NV_low_latency2"
    else
        echo "==> nvk_physical_device.c: NV_low_latency2 already advertised — skipping."
    fi

    # -----------------------------------------------------------------------
    # Step 8: entry points
    #
    # NVK uses vk_entrypoints_gen with the full Vulkan API XML as input.
    # Prototypes for NV_low_latency2 are generated automatically once the
    # extension is advertised in Step 7.  No Python file needs editing.
    # -----------------------------------------------------------------------
}

_icd_cache_msg() {
    echo ""
    echo "=========================================================="
    echo " mesa-dlss-reflex-git: POST-INSTALL / UPGRADE NOTICE"
    echo "=========================================================="
    echo " Run the following to ensure the Vulkan loader picks up"
    echo " the correct driver and extension list:"
    echo ""
    echo "   sudo ldconfig"
    echo ""
    echo " If you previously had a different mesa build installed,"
    echo " also clear the shader / pipeline caches so stale"
    echo " extension state from the old driver does not persist:"
    echo ""
    echo "   rm -rf ~/.cache/mesa_shader_cache"
    echo "   rm -rf \${XDG_CACHE_HOME:-~/.cache}/mesa_shader_cache"
    echo ""
    echo " Then relaunch the game.  DLSS requires:"
    echo "   DXVK_ENABLE_NVAPI=1 PROTON_ENABLE_NVAPI=1"
    echo "=========================================================="
    echo ""
}

post_install() { _icd_cache_msg; }
post_upgrade() { _icd_cache_msg; }

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
