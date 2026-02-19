# Maintainer: crueter <crueter at crueter dot x y z>
# Contributor: DEX
pkgname=vulkan-terakan-git
pkgver=26.0.0.r208349.g38146e0a9a8
pkgrel=1
pkgdesc="Triangl3's Mesa fork with amd_terascale Vulkan support (Terakan branch)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa.git"
license=('custom')
depends=(
  'libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
  'libunwind' 'libxml2' 'zstd' 'expat' 'lm_sensors'
  'libvdpau' 'libva' 'wayland' 'xorg-xwayland' 'libxrandr'
  'libxinerama' 'zlib'
)
makedepends=(
  'meson' 'ninja' 'python-mako' 'libxrandr' 'wayland-protocols'
  'libx11' 'libxext' 'xorgproto' 'libomxil-bellagio'
  'git' 'python-ply' 'glslang' 'libclc' 'spirv-tools' 'vulkan-headers'
  'spirv-llvm-translator' 'python-setuptools' 'python-yaml')
provides=('vulkan-driver')
source=("mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan"
    "0001-fix-c23.patch")
sha256sums=('SKIP'
            '73cfb3dedafe937996b171c55082d6317cf62e4371f6c1146c2d2a902cf7060b')

pkgver() {
  cd mesa
  echo "26.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd mesa
    patch -Np1 -i ../0001-fix-c23.patch
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
}
