# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=vulkan-nouveau-git
pkgdesc="Nouveau Vulkan (NVK) EXPERIMENTAL Mesa driver with some additions (Git version)"
pkgver=23.3.branchpoint.r2902.g2487e18
pkgrel=1
arch=('x86_64')
depends=('libdrm' 'libxshmfence' 'libx11' 'systemd-libs' 'vulkan-icd-loader' 'wayland')
makedepends=('elfutils' 'git' 'glslang' 'libunwind' 'libxrandr' 'meson>=1.3.0rc2' 'python-mako'
             'rust' 'rust-bindgen' 'systemd' 'valgrind' 'wayland-protocols' 'xorgproto' 'zstd') # -rc1 has weird crate issues
optdepends=('vulkan-mesa-layers: Additional Vulkan layers'
            'linux>=6.6.arch1: Minimum required kernel for new uAPI support')
provides=('vulkan-driver')
url="https://gitlab.freedesktop.org/mesa/mesa"
license=('custom')
source=("git+${url}.git"
        nvk-memory-budget.patch
        nvk-present-wait.patch
        LICENSE)
sha512sums=('SKIP'
            '6bb223fb4c4e799c71bca2b4e8f290cda94fe712a9d378e9b4a43280831b7e96f8ef9d94d6c1fa1a29c39e123ead3ef573bc54e3ae4484070fff2bd1cf316e3f'
            '7a46a11c7ae795597fde80cc162eb13db287f6f549428d729b328eb4d9be35bbe3e2c8a47e5a19a808a9a47f8b17c32c5fd20f19fb4e8a18af73124ae0d76ef6'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
install="${pkgname}.install"

prepare() {
  # HACK: Don't copy Mesa defaults (they're basically useless for this standalone driver)
  # TODO: replace this with a build option if possible
  cd mesa
  sed -i 's/install_data/#install_data/' src/util/meson.build

  # HACK: Disable xcb-util-keysyms dependency
  # It's only used for a RADV-specific trace feature so it's useless for us
  sed -i 's/with_xcb_keysyms = dep_xcb_keysyms.found()/with_xcb_keysyms = false/' meson.build

  # Set some common patch command options
  _patch_opts="--no-backup-if-mismatch -Np1 -i"

  ### DXVK v2.0+ FIRE FESTIVAL (that is somehow working) ###

  # HACK turned up to 11: Advertise Vulkan 1.3 support
  sed -i 's/VK_MAKE_VERSION(1, [0-9]/VK_MAKE_VERSION(1, 3/' src/nouveau/vulkan/nvk_instance.c
  sed -i 's/VK_MAKE_VERSION(1, [0-9]/VK_MAKE_VERSION(1, 3/' src/nouveau/vulkan/nvk_physical_device.c
  sed -i 's/1\.[0-9]/1\.3/g' src/nouveau/vulkan/meson.build

  # HACK: Always expose Vulkan memory model
  # NAK does properly support it now but the compiler is still WIP for pre-Volta GPUs (so I'll enable it at the cost of CTS tests)
  sed -i 's/KHR_vulkan_memory_model = nvk_use_nak(info)/KHR_vulkan_memory_model = true/' src/nouveau/vulkan/nvk_physical_device.c
  sed -i 's/vulkanMemoryModel = nvk_use_nak(info)/vulkanMemoryModel = true/' src/nouveau/vulkan/nvk_physical_device.c

  ### Misc stuff ###

  # Add EXT_memory_budget (https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/172)
  # (fixes a vulkaninfo warning)
  patch ${_patch_opts} ../nvk-memory-budget.patch

  # Pipeline caching (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25550)
  # (might improve performance) (this patch is rebased for the NVK shader code rework)
  # TODO: Fix the segfault issues/MMU faults with this enabled after the recent shader changes
  #patch ${_patch_opts} ../nvk-pipeline-cache.patch

  # VK_KHR_present_id/wait support (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26752)
  # (this should get us closer to gamescope compatibility)
  patch ${_patch_opts} ../nvk-present-wait.patch

  # Mark this NVK package with a signature (so I could track who's using it for bug report purposes)
  sed -i 's/"Mesa " PACKAGE_VERSION/"Mesa DodoNVK " PACKAGE_VERSION/' src/nouveau/vulkan/nvk_physical_device.c
}

pkgver() {
  cd mesa
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Auto-download Rust crates for NAK (removes extra code for crate handling)
  _nak_crate="--force-fallback-for=syn"

  # HACK: Remove crate .rlib files before build
  # (This prevents build errors after a Rust update: https://github.com/mesonbuild/meson/issues/10706)
  [ -d build/subprojects ] && find build/subprojects -iname "*.rlib" -delete

  # As you can see, I optimized the build options pretty well 🐸
  arch-meson mesa build \
    --reconfigure \
    --wrap-mode=nofallback \
    ${_nak_crate} \
    -D b_ndebug=false \
    -D platforms=x11,wayland \
    -D gallium-drivers= \
    -D vulkan-drivers=nouveau-experimental \
    -D vulkan-layers= \
    -D dri3=enabled \
    -D egl=disabled \
    -D gallium-extra-hud=false \
    -D gallium-nine=false \
    -D gallium-omx=disabled \
    -D gallium-opencl=disabled \
    -D gallium-va=disabled \
    -D gallium-vdpau=disabled \
    -D gallium-xa=disabled \
    -D gbm=disabled \
    -D gles1=disabled \
    -D gles2=disabled \
    -D glvnd=false \
    -D glx=disabled \
    -D libunwind=enabled \
    -D llvm=disabled \
    -D lmsensors=disabled \
    -D osmesa=false \
    -D shared-glapi=disabled \
    -D microsoft-clc=disabled \
    -D valgrind=enabled \
    -D android-libbacktrace=disabled

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
