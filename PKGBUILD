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
# + local VK_NV_low_latency2 (Nvidia Reflex) implementation for NVK.
# GPU: Turing (RTX 20xx / GTX 16xx) or newer, drm/nouveau (not nvidia.ko).
#
# Enable DLSS:   DXVK_ENABLE_NVAPI=1 PROTON_ENABLE_NVAPI=1 %command%
# Enable Reflex (D3D12 / VKD3D-Proton path):
#   Exposed automatically — VKD3D-Proton >=2.12 calls vkSetLatencySleepModeNV
#   etc. directly on the Vulkan driver.  No extra env vars required beyond the
#   NVAPI ones above.
# Enable Reflex (D3D11 / DXVK path):
#   Also requires the VK_LAYER_DXVK_NVAPI_reflex Vulkan layer from dxvk-nvapi
#   (available in the AUR as dxvk-nvapi or via Proton).  DXVK-NVAPI's D3D11
#   Reflex path makes "technically invalid" Vulkan calls that the layer
#   intercepts, enriches, and forwards to the driver.

pkgname=mesa-dlss-reflex-git
pkgdesc="Mesa git with VK_NVX_binary_import (NVK DLSS) + VK_NV_low_latency2 (NVK Reflex)"
pkgver=26.1.0_devel.219860.5542f4ee5b6.nvkdlssreflex  # filled by pkgver()
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
)
b2sums=(
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
        echo "==> nak/api.rs: patching max_warps_per_sm..."
        git apply --3way "$srcdir/nak_api.patch" || {
            # Fallback: sed-based replacement if git apply cannot find context.
            sed -i '/pub extern "C" fn nak_max_warps_per_sm/,/^}/{
                /crate::ir::max_warps_per_sm/c\    let total_regs: u32 = 65536;\n    let gprs = num_gprs.max(1).next_multiple_of(8);\n    crate::ir::prev_multiple_of((total_regs \/ 32) \/ gprs, 4)
            }' "$_api"
        }
    fi

    # -----------------------------------------------------------------------
    # Step 5: install nvk_nv_low_latency2.c
    # -----------------------------------------------------------------------
    echo "==> Installing nvk_nv_low_latency2.c..."
    cp "$srcdir/nvk_nv_low_latency2.c" src/nouveau/vulkan/nvk_nv_low_latency2.c

    # -----------------------------------------------------------------------
    # Step 6: add nvk_nv_low_latency2.c to NVK's meson.build source list
    # -----------------------------------------------------------------------
    local _mb="src/nouveau/vulkan/meson.build"
    if ! grep -q 'nvk_nv_low_latency2\.c' "$_mb"; then
        echo "==> meson.build: adding nvk_nv_low_latency2.c..."
        # Insert before the first of several stable anchor filenames.
        local _done=0
        for _anchor in 'nvk_device\.c' 'nvk_buffer\.c' \
                        'nvk_cmd_buffer\.c' 'nvk_physical_device\.c'; do
            if grep -q "'${_anchor}'" "$_mb"; then
                sed -i "/'${_anchor}'/i\\  'nvk_nv_low_latency2.c'," "$_mb"
                _done=1
                break
            fi
        done
        if [ "$_done" -eq 0 ]; then
            echo "==> meson.build: WARNING — no anchor found, appending to files() block..."
            sed -i "/^  files(/,/^  )/{/^  )/i\\  'nvk_nv_low_latency2.c',
}" "$_mb"
        fi
    fi

    # -----------------------------------------------------------------------
    # Step 7: advertise VK_NV_low_latency2 in nvk_physical_device.c
    # -----------------------------------------------------------------------
    local _pd="src/nouveau/vulkan/nvk_physical_device.c"
    if ! grep -q 'NV_low_latency2' "$_pd"; then
        echo "==> nvk_physical_device.c: advertising NV_low_latency2..."
        # Insert after the last existing .NV_<name> = <bool>, line.
        # The sed address selects the last such line in the file by repeated
        # substitution — we store the candidate and flush at end-of-file.
        if grep -qE '^\s+\.NV_[A-Za-z0-9_]+ = (true|false),' "$_pd"; then
            # Python-free approach: find line number of last .NV_ entry,
            # then use sed to insert after it.
            local _ln
            _ln=$(grep -nE '^\s+\.NV_[A-Za-z0-9_]+ = (true|false),' "$_pd" \
                  | tail -1 | cut -d: -f1)
            sed -i "${_ln}a\\      .NV_low_latency2 = true," "$_pd"
        else
            # Fallback: insert after .KHR_swapchain = true,
            sed -i '/\.KHR_swapchain\s*=\s*true,/a\      .NV_low_latency2 = true,' \
                "$_pd"
        fi
    fi

    # -----------------------------------------------------------------------
    # Step 8: register VK_NV_low_latency2 entry points
    #
    # NVK uses vk_entrypoints_gen with the full Vulkan API XML as input, so
    # prototypes for all registered extensions (including NV_low_latency2)
    # are generated automatically once the extension is advertised above.
    # No entrypoints Python file needs editing.
    # -----------------------------------------------------------------------
    echo "==> Entry points handled automatically by vk_entrypoints_gen."
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
