# Maintainer: zeakz <zeakz@protonmail.com>
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

pkgname=mesa-git-dlss-reflex
pkgdesc="Mesa git with VK_NVX_binary_import (NVK DLSS) + VK_NV_low_latency2 (NVK Reflex)"
pkgver=26.1.0_devel.219858.3bac5a871ad.nvkdlssreflex  # filled by pkgver()
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
    'patch_api_rs.py'
    'patch_meson_sources.py'
    'patch_physical_device.py'
    'patch_entrypoints.py'
)
b2sums=(
    'SKIP'
    '371cea0a468ab0bdc0eeae46633e9b9d8856f0f3cda5b43028ffa8f52e5f4759ece5d00e3e8dd064b5af93fcc10095e73d18ab51353c81537bc373f8311ebec5'
    '4c6cf948b4cadbe24802083fc3a86dd59c0994cafc28cc5463e8178cc27cd7b026f10b16ec33bfbe24eb53d01f82a9e3328176efb88f1da269b5ad4def7e5593'
    '118519782faf18a0f4c324c4cb8c411d253206af9898ff44fdcda0d78e74c36fb7963b638bd0356f5dea6fe6b97ff42ae2f09ecfb2610d8ee948937476ebcb49'
    '7f3a9096598f41f0891e50d366fefe23872540535242532f8fe7eb4ff18bfc191d99917e5b32f0a704de85f2ea0f257d77840f7d34c75ca3742c882d8e2b9720'
    '17474b00f250bff2f0691a6db6ea458df1bf6ba8977aa237d45a203c5bacb181c9775145bf13f7de0813e0099af8e3411f0955dc98b57c6e81797afde926c61e'
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
    # Format: <mesa-version>.<commit-count>.<short-hash>.nvkdlssreflex
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
            echo "==> MR is already part of mesa main — skipping merge."
        else
            echo "==> Merging MR (commit $_mr_head) into main..."
            if ! git -c user.email="makepkg@localhost" -c user.name="makepkg" \
                    merge -X theirs --no-gpg-sign --no-edit FETCH_HEAD; then
                echo "==> Merge failed; attempting to continue with conflicts resolved by 'ours'..."
                git merge --abort 2>/dev/null || true
                git -c user.email="makepkg@localhost" -c user.name="makepkg" \
                    merge -X ours --no-gpg-sign --no-edit FETCH_HEAD
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
    python3 "$srcdir/patch_api_rs.py"

    # -----------------------------------------------------------------------
    # Step 5: nvk_nv_low_latency2.c — install or upgrade to v2
    # -----------------------------------------------------------------------
    local _target="src/nouveau/vulkan/nvk_nv_low_latency2.c"
    if [ -f "$_target" ] && grep -q 'll2_sleep_thread' "$_target" && grep -q 'NVK_LL2_TOMBSTONE' "$_target"; then
        echo "==> nvk_nv_low_latency2.c: v2 already present — skipping."
    else
        echo "==> nvk_nv_low_latency2.c: installing v2..."
        cp "$srcdir/nvk_nv_low_latency2.c" "$_target"
    fi

    # -----------------------------------------------------------------------
    # Step 6: Add nvk_nv_low_latency2.c to NVK's meson.build source list
    # -----------------------------------------------------------------------
    python3 "$srcdir/patch_meson_sources.py"

    # -----------------------------------------------------------------------
    # Step 7: Advertise VK_NV_low_latency2 in nvk_physical_device.c
    # -----------------------------------------------------------------------
    python3 "$srcdir/patch_physical_device.py"

    # -----------------------------------------------------------------------
    # Step 8: Register VK_NV_low_latency2 entry points in NVK's dispatch table
    # -----------------------------------------------------------------------
    python3 "$srcdir/patch_entrypoints.py"
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
