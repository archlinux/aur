# Maintainer: DEX
pkgname=lib32-vulkan-terakan-git
pkgver=24.1.0.r0.gTerakan
pkgrel=1
pkgdesc="32-bit build of Triangl3's Mesa fork with amd_terascale Vulkan support (Terakan branch)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa.git"
license=('custom')
depends=('lib32-libdrm' 'lib32-libx11' 'lib32-libxext' 'lib32-libxdamage'
         'lib32-libxxf86vm' 'lib32-libxshmfence' 'lib32-libelf'
         'lib32-libunwind' 'lib32-libxml2' 'lib32-expat' 'lib32-zstd'
         'lib32-lm_sensors' 'vulkan-terakan-git')
makedepends=('git' 'meson' 'ninja' 'python-mako' 'lib32-llvm' 'lib32-zlib'
             'lib32-libglvnd' 'lib32-wayland' 'lib32-vulkan-icd-loader'
             'lib32-wayland-protocols' 'vulkan-headers')
provides=('lib32-mesa' 'lib32-vulkan-driver')
conflicts=('lib32-mesa')
source=("mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan")
sha256sums=('SKIP')

pkgver() {
  cd mesa
  echo "24.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd mesa
  rm -rf build-lib32
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  meson setup build-lib32 \
    --prefix=/usr \
    --libdir=lib32 \
    --buildtype=release \
    -Dgallium-drivers=r600,swrast \
    -Dvulkan-drivers=amd_terascale \
    -Ddri-drivers= \
    -Dplatforms=x11,wayland,surfaceless \
    -Dgallium-nine=false \
    -Dllvm=true \
    -Dshared-llvm=true \
    -Dgbm=disabled \
    -Dgles1=false \
    -Dgles2=false \
    -Degl=enabled \
    -Dglx=dri \
    -Dshared-glapi=enabled \
    -Dosmesa=false \
    -Dlmsensors=false \
    -Dzstd=true \
    -Dvalgrind=disabled \
    -Dglvnd=true
  ninja -C build-lib32
}

package() {
  cd mesa
  DESTDIR="$pkgdir" ninja -C build-lib32 install

  # Move installed files to /usr/lib32
  install -dm755 "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/lib/"* "$pkgdir/usr/lib32/" || true
  rmdir "$pkgdir/usr/lib" 2>/dev/null || true

  # License
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
