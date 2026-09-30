# Maintainer: crueter <crueter at crueter dot x y z>
# Contributor: DEX
pkgname=vulkan-terakan-git
pkgver=26.0.0.r225468.g88a703a2548
pkgrel=1
pkgdesc="Standalone Vulkan library for Triangl3's Terakan"
arch=('x86_64' 'aarch64')
url="https://gitlab.freedesktop.org/Triang3l/mesa.git"
license=('custom')
depends=(
  'libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
  'libunwind' 'libxml2' 'zstd' 'expat' 'lm_sensors'
  'libvdpau' 'libva' 'wayland' 'xorg-xwayland' 'libxrandr'
  'libxinerama' 'zlib')
makedepends=(
  'meson' 'ninja' 'python-mako' 'libxrandr' 'wayland-protocols'
  'libx11' 'libxext' 'xorgproto' 'libomxil-bellagio'
  'git' 'python-ply' 'glslang' 'libclc' 'spirv-tools' 'vulkan-headers'
  'spirv-llvm-translator' 'python-setuptools' 'python-yaml')
provides=('vulkan-driver')
source=("mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan")
sha256sums=('SKIP')

pkgver() {
  cd mesa
  echo "26.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd mesa
  rm -rf build

  meson setup build \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Dgallium-drivers= \
    -Dvulkan-drivers=amd_terascale \
    -Dplatforms=x11,wayland \
    -Dllvm=disabled \
    -Dvalgrind=disabled \
    -Dlmsensors=enabled \
    -Dzstd=enabled \
    -Dxlib-lease=enabled \
    -Dshader-cache=enabled \
    -Dlibunwind=enabled

  ninja -C build
}


package() {
  cd mesa
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # This is already installed by MESA.
  # We don't need it.
  rm -rf "$pkgdir"/usr/share/drirc.d
}
