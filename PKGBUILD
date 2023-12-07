# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=lib32-vulkan-nouveau-git
pkgdesc="Nouveau Vulkan (NVK) EXPERIMENTAL Mesa driver with some additions (32-bit Git version)"
pkgver=23.3.branchpoint.r2194.gdc69c5b
pkgrel=1
arch=('x86_64')
depends=('lib32-libdrm' 'lib32-libxshmfence' 'lib32-libx11' 'lib32-systemd' 'lib32-vulkan-icd-loader' 'lib32-wayland')
makedepends=('elfutils' 'git' 'glslang' 'lib32-libunwind' 'lib32-libxrandr' 'lib32-rust-libs' 'meson>=1.3.0rc2'
             'python-mako' 'rust-bindgen' 'systemd' 'wayland-protocols' 'xorgproto' 'zstd')  # -rc1 has weird crate issues
optdepends=('lib32-vulkan-mesa-layers: Additional Vulkan layers'
            'linux>=6.6.arch1: Minimum required kernel for new uAPI support')
provides=('lib32-vulkan-driver')
url="https://gitlab.freedesktop.org/mesa/mesa"
license=('custom')
source=("git+${url}.git"
        nvk-memmodel.patch
        nvk-memory-budget.patch
        nvk-pipeline-cache.patch
        LICENSE)
sha512sums=('SKIP'
            'e7d3152d918a7c8d438bd58f1efffb199842034dee876a60ea9aea5fa9d6de558bdb1c708572ad7cd2b5436bafbd2e945ce18a1ade560dfeba6b1359549a0e74'
            '770d195f571aabc0e9dddf254576c29bbfff34ff0af0edfb6ede9864d25ef12247f2f5afd770d5ca70e8a9ac900623b92892211d73bd8bd4075d95c012367742'
            '288eb603be08ea388cb0af2245c751077b6ab2e45a8f0d3eca68a262622de5474d4a53b7b23474c926af36aa0766f588b9d609c7438df6625906e2aa8db8b33b'
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
  sed -i 's/VK_MAKE_VERSION(1, 1/VK_MAKE_VERSION(1, 3/' src/nouveau/vulkan/nvk_instance.c
  sed -i 's/VK_MAKE_VERSION(1, [0-9]/VK_MAKE_VERSION(1, 3/' src/nouveau/vulkan/nvk_physical_device.c
  sed -i 's/1\.0/1\.3/' src/nouveau/vulkan/meson.build

  # Expose Vulkan memory model
  # I highly doubt this passes CTS (and it doesn't) but it works well enough for DXVK
  patch ${_patch_opts} ../nvk-memmodel.patch

  ### Misc stuff ###

  # Add EXT_memory_budget (https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/172)
  # (fixes a vulkaninfo warning)
  patch ${_patch_opts} ../nvk-memory-budget.patch

  # Pipeline caching (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25550)
  # (might improve performance) (this patch is rebased for the NVK shader code rework)
  patch ${_patch_opts} ../nvk-pipeline-cache.patch

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
    --cross-file lib32 \
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
    -D valgrind=disabled \
    -D android-libbacktrace=disabled

  ninja -C build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
