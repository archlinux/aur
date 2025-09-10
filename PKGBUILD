# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=lib32-vulkan-nouveau-git
pkgdesc="Nouveau Vulkan (NVK) Mesa driver with some additions (32-bit Git version)"
pkgver=25.2.branchpoint.r3036.g6fe4b7344
pkgrel=1
arch=('x86_64')
depends=('lib32-libdrm' 'lib32-libxcb' 'lib32-libxshmfence' 'lib32-libx11' 'lib32-spirv-tools' 'lib32-systemd'
         'lib32-vulkan-icd-loader' 'lib32-wayland' 'lib32-zlib' 'lib32-zstd')
makedepends=('cbindgen' 'elfutils' 'git' 'glslang' 'libclc' 'lib32-clang' 'lib32-libunwind' 'lib32-libxrandr'
             'lib32-llvm' 'lib32-rust-libs' 'lib32-spirv-llvm-translator' 'meson>=1.3.0rc2' 'python-mako'
             'python-packaging' 'python-yaml' 'rust-bindgen' 'systemd' 'wayland-protocols' 'xorgproto') # Meson 1.3.0-rc1 has weird crate issues
optdepends=('lib32-vulkan-mesa-layers: Additional Vulkan layers'
            'linux>=6.6.arch1: Minimum required kernel for new uAPI support')
provides=('lib32-vulkan-driver')
conflicts=('lib32-vulkan-nouveau')
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

  # HACK: Force the 32-bit Rust target for bindgen
  # (This makes bindgen produce the correct 32-bit struct sizes)
  # FIXME: This probably breaks non-x86 compilation
  export TARGET=i686-unknown-linux-gnu

  # As you can see, I optimized the build options pretty well 🐸
  arch-meson mesa build \
    --cross-file lib32 \
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
    -D valgrind=disabled \
    -D android-libbacktrace=disabled \
    -D intel-rt=disabled \
    -D xmlconfig=disabled \
    -D expat=disabled \
    -D display-info=disabled

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 mesa/docs/license.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
