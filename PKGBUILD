# Maintainer: shipa
# Terakan full stack (Vulkan + r600 Gallium) for AMD TeraScale GPUs.
# Branch: Terakan_Backup_2026-06-10_2_Meta_MSAA

pkgbase=vulkan-terakan
pkgname=(vulkan-terakan lib32-vulkan-terakan)
pkgver=2026.06.10.r208352.g3ea9ca1acfd
pkgrel=8
_branch=Terakan_Backup_2026-06-10_2_Meta_MSAA
pkgdesc="Vulkan 1.1 and OpenGL (r600) for AMD TeraScale (HD 2000-7000)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa"
license=('MIT' 'custom')
depends=(
  'libdrm' 'libx11' 'libxcb' 'xcb-util-keysyms' 'libxshmfence' 'libxext' 'libxfixes'
  'libxxf86vm' 'libxrandr' 'zstd' 'expat' 'vulkan-icd-loader' 'libglvnd'
  'libva' 'libvdpau' 'wayland' 'xorg-xwayland' 'llvm-libs' 'libelf'
  'libunwind' 'lm_sensors'
)
makedepends=(
  'git' 'meson' 'ninja' 'python-packaging' 'python-mako' 'python-yaml'
  'llvm' 'clang' 'glslang' 'vulkan-headers' 'wayland-protocols' 'xorgproto'
  'gcc-multilib' 'lib32-gcc-libs' 'lib32-llvm' 'lib32-libdrm' 'lib32-libelf'
  'lib32-libunwind' 'lib32-libx11' 'lib32-libxcb' 'lib32-libxshmfence'
  'lib32-libxext' 'lib32-libxfixes' 'lib32-libxxf86vm' 'lib32-libxrandr'
  'lib32-zlib' 'lib32-zstd' 'lib32-expat' 'lib32-vulkan-icd-loader' 'lib32-libva'
  'lib32-libvdpau' 'lib32-wayland' 'lib32-lm_sensors' 'lib32-spirv-tools'
)
optdepends=(
  'wine: DirectX/Vulkan in Windows apps via terakan-dx-setup'
  'lib32-vulkan-icd-loader: 32-bit Vulkan loader (pulled by lib32 package)'
)
provides=('vulkan-driver')
conflicts=('vulkan-terakan-git')
options=('!lto' '!debug')
source=(
  "mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=${_branch}"
  "0001-fix-c23.patch"
  "0002-fix-c23-pthread-casts.patch"
  "0003-bump-api-version-1.1.patch"
  "0004-implement-cmd-blit-image2.patch"
  "0005-implement-scaled-blit-image2.patch"
  "0006-blit-batch-and-dynamic-indexing-features.patch"
  "terakan.conf"
  "terakan-vulkan-setup"
  "terakan-dx-setup"
  "terakan-vulkan32-setup"
  "README.md"
)
sha256sums=(
  'SKIP'
  '13a7d4006ba79735eb464756785e0b17d5d6840db59842d95b9dcd181c89f513'
  '15d23b8f4da065e684db6c6279a91d6dbf5d6d396fb45eb5e6eaba1e3250a4d3'
  'cc92dff47c4bbd327972dc037f23050a37ec7019c3ba60c948cd74322d09154f'
  '83aab2832bd7b86f52e6c08f15d728791b66b58d97d7ff6339ae9f01644f2e41'
  '2ddc54b476a657c4c16505867de20a3d73778283e57bccb3aec84ebbd745d33a'
  '6bebe5e347775d58f13051a8a2b06d0cb1efbc7d5df721aff804ebc13504fe06'
  '3f7a429cc643ae1c50111f91656c3f6de0279e49a66e861110a768080dd9d652'
  '5fea9547b4bc130864805e3b64a797ebf1365d0196aee783e67dbcf442882c55'
  '5b66a14acad9b569f7c0ae64206b7f6482801ed1e462f6c5ba565de98b4f2cd8'
  'eab6c4da7930810dac9fbd9ada350d95a76a5d579613621561df11b35384fee7'
  '54f9de177e1a06377c10af719c5ec09e98d96d665970814fa5af5a0af164322d'
)

# GCC 16 + glibc 2.42+: C-only; do not pass to C++ (invalid for g++).
_glibc_c23_compat=(
  -Dc_args='-Wno-incompatible-pointer-types'
)

_meson_native64() {
  unset PKG_CONFIG_LIBDIR
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
  unset CC CXX CFLAGS CXXFLAGS LDFLAGS
}

_meson_lib32() {
  # lib32 libs from /usr/lib32; arch-independent .pc files (wayland-protocols,
  # xorgproto, vulkan-headers, etc.) live in /usr/share/pkgconfig.
  export PKG_CONFIG_LIBDIR="/usr/lib32/pkgconfig"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/share/pkgconfig"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export LDFLAGS="-m32"
}

# lib32: Vulkan ICD only — coexists with system lib32-mesa (no r600/EGL/gbm).
_lib32_meson=(
  --prefix=/usr
  --libdir=lib32
  --buildtype=release
  -Dc_args='-m32 -Wno-incompatible-pointer-types'
  -Dc_link_args='-m32'
  -Dcpp_args='-m32'
  -Dcpp_link_args='-m32'
  -Dvulkan-drivers=amd_terascale
  -Dgallium-drivers=
  -Dglx=disabled
  -Degl=disabled
  -Dgbm=disabled
  -Dopengl=false
  -Dgles1=disabled
  -Dgles2=disabled
  -Dllvm=disabled
  -Dvalgrind=disabled
  -Dlmsensors=enabled
  -Dzstd=enabled
  -Dshader-cache=enabled
  -Dlibunwind=enabled
  -Dplatforms=x11,wayland
  '-Dtools=[]'
)

_strip_mesa_system_dupes() {
  # Files already owned by mesa / lib32-mesa on a normal Arch system.
  rm -rf "$pkgdir/usr/share/drirc.d"
  rm -rf "$pkgdir/usr/share/glvnd"
  rm -rf "$pkgdir/usr/include"
}

pkgver() {
  cd mesa
  printf '%s.r%s.g%s' \
    '2026.06.10' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd mesa
  patch -Np1 -i ../0001-fix-c23.patch
  patch -Np1 -i ../0002-fix-c23-pthread-casts.patch
  patch -Np1 -i ../0003-bump-api-version-1.1.patch
  patch -Np1 -i ../0004-implement-cmd-blit-image2.patch
  patch -Np1 -i ../0005-implement-scaled-blit-image2.patch
  patch -Np1 -i ../0006-blit-batch-and-dynamic-indexing-features.patch

  # Sanity check: required on glibc 2.42+ (C23 once_flag in stdlib.h).
  grep -q '#ifndef __once_flag_defined' src/c11/threads.h
  grep -q 'pthread_mutex_t \*)mtx' src/util/cnd_monotonic.c
}

build() {
  cd mesa
  rm -rf build-vulkan build-gallium build-lib32

  # 64-bit Vulkan ICD -> /usr/lib
  _meson_native64
  meson setup build-vulkan \
    -Dwrap_mode=nodownload \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Dvulkan-drivers=amd_terascale \
    -Dgallium-drivers= \
    -Dglx=disabled \
    -Degl=disabled \
    -Dgbm=disabled \
    -Dopengl=false \
    -Dgles1=disabled \
    -Dgles2=disabled \
    -Dllvm=disabled \
    -Dvalgrind=disabled \
    -Dlmsensors=enabled \
    -Dzstd=enabled \
    -Dshader-cache=enabled \
    -Dlibunwind=enabled \
    -Dplatforms=x11,wayland \
    '-Dtools=[]' \
    "${_glibc_c23_compat[@]}"
  meson compile -C build-vulkan

  # 64-bit OpenGL (r600) + duplicate Vulkan -> /usr/local
  _meson_native64
  meson setup build-gallium \
    -Dwrap_mode=nodownload \
    --prefix=/usr/local \
    --libdir=lib \
    --buildtype=release \
    -Dvulkan-drivers=amd_terascale \
    -Dgallium-drivers=r600 \
    -Dglx=dri \
    -Degl=enabled \
    -Dgbm=enabled \
    -Dplatforms=x11,wayland \
    -Dlmsensors=enabled \
    -Dzstd=enabled \
    -Dshader-cache=enabled \
    -Dlibunwind=enabled \
    '-Dtools=[]' \
    "${_glibc_c23_compat[@]}"
  meson compile -C build-gallium

  # 32-bit stack for Wine -> /usr/lib32
  _meson_lib32
  pkg-config --exists wayland-protocols || {
    echo "ERROR: wayland-protocols not found. Install: pacman -S wayland-protocols"
    exit 1
  }
  meson setup build-lib32 \
    -Dwrap_mode=nodownload \
    "${_glibc_c23_compat[@]}" "${_lib32_meson[@]}"
  meson compile -C build-lib32
}

package_vulkan-terakan() {
  pkgdesc="Vulkan 1.0 and OpenGL (r600) for AMD TeraScale (HD 2000-7000)"
  depends+=('vulkan-icd-loader' 'libglvnd')
  provides=('vulkan-driver')

  cd mesa
  DESTDIR="$pkgdir" meson install -C build-vulkan --no-rebuild
  DESTDIR="$pkgdir" meson install -C build-gallium --no-rebuild

  install -Dm644 ../terakan.conf "$pkgdir/etc/modprobe.d/terakan.conf"
  install -Dm755 ../terakan-vulkan-setup "$pkgdir/usr/bin/terakan-vulkan-setup"
  install -Dm755 ../terakan-dx-setup "$pkgdir/usr/bin/terakan-dx-setup"
  install -Dm644 ../README.md "$pkgdir/usr/share/doc/vulkan-terakan/README.md"
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/vulkan-terakan/LICENSE"

  # ICD from gallium install may point at /usr/local; primary driver is /usr/lib (WSI build).
  if [[ -f "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json" ]]; then
    sed -i 's|/usr/local/lib/libvulkan_terascale.so|/usr/lib/libvulkan_terascale.so|g' \
      "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json"
  elif [[ -f "$pkgdir/usr/local/share/vulkan/icd.d/terascale_icd.x86_64.json" ]]; then
    install -Dm644 "$pkgdir/usr/local/share/vulkan/icd.d/terascale_icd.x86_64.json" \
      "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json"
    sed -i 's|/usr/local/lib/libvulkan_terascale.so|/usr/lib/libvulkan_terascale.so|g' \
      "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json"
  fi

  _strip_mesa_system_dupes
}

package_lib32-vulkan-terakan() {
  pkgdesc="32-bit Terakan Vulkan ICD for AMD TeraScale (Wine)"
  depends=(
    'vulkan-terakan'
    'lib32-libdrm' 'lib32-libxcb' 'lib32-xcb-util-keysyms' 'lib32-libxshmfence'
    'lib32-zstd' 'lib32-expat' 'lib32-vulkan-icd-loader'
  )
  provides=('lib32-vulkan-driver')

  cd mesa
  DESTDIR="$pkgdir" meson install -C build-lib32 --no-rebuild

  install -Dm755 ../terakan-vulkan32-setup "$pkgdir/usr/bin/terakan-vulkan32-setup"
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/lib32-vulkan-terakan/LICENSE"

  if [[ -f "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json" ]]; then
    mv "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json" \
      "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.i686.json"
  fi

  _strip_mesa_system_dupes
}
