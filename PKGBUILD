# Maintainer: DEX
pkgname=vulkan-terakan-git
pkgver=24.1.0.r0.gTerakan
pkgrel=1
pkgdesc="Triangl3's Mesa fork with amd_terascale Vulkan support (Terakan branch)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa.git"
license=('custom')
depends=(
  'libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
  'libunwind' 'libxml2' 'zstd' 'expat' 'lm_sensors'
  'libvdpau' 'libva' 'wayland' 'xorg-xwayland' 'libxrandr'
  'libxinerama' 'llvm-libs' 'libglvnd' 'zlib'
)
makedepends=(
  'meson' 'ninja' 'python-mako' 'libxrandr' 'wayland-protocols'
  'libx11' 'libxext' 'spirv-llvm-translator' 'xorgproto' 'llvm' 'libomxil-bellagio'
  'git' 'python-ply' 'glslang' 'libclc' 'spirv-tools' 'vulkan-headers')
provides=('mesa' 'vulkan-driver')
conflicts=('mesa')
source=("mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan")
sha256sums=('SKIP')

pkgver() {
  cd mesa
  echo "24.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd mesa
  rm -rf build

  meson setup build \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Dgallium-drivers=radeonsi,r600,swrast \
    -Dvulkan-drivers=amd_terascale \
    -Dplatforms=x11,wayland \
    -Ddri3=enabled \
    -Degl=enabled \
    -Dgbm=enabled \
    -Dglx=dri \
    -Dgles1=enabled \
    -Dgles2=enabled \
    -Dllvm=enabled \
    -Dshared-llvm=enabled \
    -Dgallium-va=enabled \
    -Dgallium-vdpau=enabled \
    -Dgallium-xa=disabled \
    -Dgallium-nine=true \
    -Dosmesa=true \
    -Dshared-glapi=enabled \
    -Dvalgrind=disabled \
    -Dlmsensors=enabled \
    -Dzstd=enabled \
    -Dxlib-lease=enabled \
    -Dglvnd=true \
    -Dshader-cache=enabled \
    -Dlibunwind=enabled

  ninja -C build
}


package() {
  cd mesa
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
