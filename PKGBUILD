# Maintainer: dex-zen <dex0aur@gmail.com>

pkgname=vulkan-terakan-git
pkgver=0.1.0.r190035
pkgrel=1
pkgdesc="Vulkan driver for AMD Terascale 2 GPUs (Radeon HD 5000/6000 series)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa"
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
depends=('libdrm' 'libx11' 'libxext' 'libxdamage' 'libxfixes' 'libxshmfence' 
         'libxxf86vm' 'libxrandr' 'libglvnd' 'libelf' 'expat' 'wayland' 
         'wayland-protocols' 'zstd' 'vulkan-icd-loader')
makedepends=('meson' 'ninja' 'python-mako' 'cmake' 'git' 'llvm' 'clang')
provides=('vulkan-driver')
conflicts=('vulkan-terakan')
options=('!lto')
source=("mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan")
sha512sums=('SKIP')

pkgver() {
  cd mesa
  local _ver=$(grep -m 1 'version :' meson.build | sed -e "s/.*'\(.*\)'.*/\1/")
  printf "%s.r%s" "0.1.0" "$(git rev-list --count HEAD)"
}

build() {
  cd mesa

  # Get the number of CPU cores for parallel building
  NPROC=$(nproc)

  # Configure with Meson
  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    --optimization=3 \
    -Db_lto=false \
    -Dgallium-drivers=r600,swrast \
    -Dvulkan-drivers=amd_terascale \
    -Dplatforms=x11,wayland \
    -Ddri3=enabled \
    -Degl=enabled \
    -Dgallium-extra-hud=true \
    -Dgallium-nine=true \
    -Dgallium-va=enabled \
    -Dgallium-vdpau=enabled \
    -Dgallium-xa=disabled \
    -Dgbm=enabled \
    -Dgles1=disabled \
    -Dgles2=enabled \
    -Dglvnd=enabled \
    -Dglx=dri \
    -Dllvm=enabled \
    -Dshared-llvm=enabled \
    -Dlmsensors=enabled \
    -Dosmesa=true \
    -Dshared-glapi=enabled \
    -Dvalgrind=disabled \
    -Dzstd=enabled \
    -Dxlib-lease=enabled \
    -Dshader-cache=enabled

  # Build
  ninja -C build -j$NPROC
}

package() {
  cd mesa

  DESTDIR="$pkgdir" ninja -C build install

  # Create Vulkan ICD file
  install -dm755 "$pkgdir/usr/share/vulkan/icd.d"
  cat > "$pkgdir/usr/share/vulkan/icd.d/terakan_icd.x86_64.json" << EOF
{
    "file_format_version": "1.0.0",
    "ICD": {
        "library_path": "/usr/lib/libvulkan_radeon.so",
        "api_version": "1.0.0"
    }
}
EOF

  # Install license
  install -Dm644 docs/license.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
