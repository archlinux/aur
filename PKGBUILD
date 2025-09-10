# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=vulkan-nouveau-git
pkgdesc="Nouveau Vulkan (NVK) Mesa driver with some additions (Git version)"
pkgver=25.2.branchpoint.r3036.g6fe4b7344
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
depends=('libdisplay-info' 'libdrm' 'libxcb' 'libxshmfence' 'libx11' 'spirv-tools' 'systemd-libs'
         'vulkan-icd-loader' 'wayland' 'zlib' 'zstd')
makedepends=('cbindgen' 'clang' 'elfutils' 'git' 'glslang' 'libclc' 'libunwind' 'libxrandr' 'llvm'
             'meson>=1.3.0rc2' 'python-mako' 'python-packaging' 'python-yaml' 'rust' 'rust-bindgen'
             'spirv-llvm-translator' 'systemd' 'valgrind' 'wayland-protocols' 'xorgproto') # Meson 1.3.0-rc1 has weird crate issues
optdepends=('vulkan-mesa-layers: Additional Vulkan layers')
optdepends_x86_64=('linux>=6.6.arch1: Minimum required kernel for new uAPI support'
                   'lib32-vulkan-nouveau-git: 32-bit application support')
provides=('vulkan-driver')
conflicts=('vulkan-nouveau')
url="https://gitlab.freedesktop.org/mesa/mesa"
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
source=("git+${url}.git")
sha512sums=('SKIP')
install="${pkgname}.install"

prepare() {
  # HACK: Don't copy Mesa's driconf defaults (they're useless for this standalone driver)
  # TODO: replace this with a build option if possible
  cd mesa
  sed -i 's/install_data/#install_data/' src/util/meson.build

  # HACK: Disable xcb-util-keysyms dependency
  # NVK doesn't support the tracing features enabled by it so it's useless for us right now
  sed -i 's/with_xcb_keysyms = dep_xcb_keysyms.found()/with_xcb_keysyms = false/' meson.build

  ### Misc stuff ###

  # Mark this NVK package with a signature (so I could track who's using it for bug report purposes)
  sed -i 's/"Mesa " PACKAGE_VERSION/"Mesa DodoNVK " PACKAGE_VERSION/' src/nouveau/vulkan/nvk_physical_device.c
}

pkgver() {
  cd mesa
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Auto-download Rust crates for NAK/NIL (avoids adding extra code for crate handling)
  _nvk_crate="--force-fallback-for=paste,rustc-hash,syn"

  # HACK: Remove crate library files before build
  # (This prevents build errors after a Rust update with dirty builds: https://github.com/mesonbuild/meson/issues/10706)
  [ -d build ] && find build -iname "*.rlib" -delete
  [ -d build/subprojects ] && find build/subprojects -iname "*.so" -delete

  # As you can see, I optimized the build options pretty well 🐸
  arch-meson mesa build \
    --reconfigure \
    --wrap-mode=nofallback \
    ${_nvk_crate} \
    -D b_ndebug=false \
    -D platforms=x11,wayland \
    -D gallium-drivers= \
    -D vulkan-drivers=nouveau \
    -D vulkan-layers= \
    -D egl=disabled \
    -D gallium-extra-hud=false \
    -D gallium-mediafoundation=disabled \
    -D gallium-va=disabled \
    -D gbm=disabled \
    -D gles1=disabled \
    -D gles2=disabled \
    -D glvnd=disabled \
    -D glx=disabled \
    -D libunwind=enabled \
    -D llvm=enabled \
    -D lmsensors=disabled \
    -D microsoft-clc=disabled \
    -D valgrind=enabled \
    -D android-libbacktrace=disabled \
    -D xmlconfig=disabled \
    -D expat=disabled

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 mesa/docs/license.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
