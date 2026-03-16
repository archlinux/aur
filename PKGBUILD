# Maintainer: Kyle "HexDecimal" Benesch <4b796c65+aur@gmail.com>
# Contributor: DEX
pkgname=lib32-vulkan-terakan-git
pkgver=26.0.0.r208349.g38146e0a9a8
pkgrel=1
pkgdesc="Standalone Vulkan Driver (32-bit) for TeraScale (ATI/AMD Radeon HD 2000-6xxx series)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa.git"
license=('custom')
depends=(
  'lib32-libelf'
  'lib32-libdrm'
  'lib32-libunwind'
  'lib32-libx11'
  'lib32-libxdamage'
  'lib32-libxext'
  'lib32-libxml2'
  'lib32-libxrandr'
  'lib32-libxshmfence'
  'lib32-libxxf86vm'
  'lib32-expat'
  'lib32-lm_sensors'
  'lib32-zstd'
  'vulkan-terakan-git'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'python-mako'
  'python-setuptools'
  'python-yaml'
  'lib32-zlib'
  'lib32-wayland'
  'lib32-vulkan-icd-loader'
  'vulkan-headers'
)
provides=('lib32-vulkan-driver')
source=(
  "mesa::git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan"
  "0001-fix-c23.patch"
)
sha256sums=(
  'SKIP'
  '73cfb3dedafe937996b171c55082d6317cf62e4371f6c1146c2d2a902cf7060b'
)

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
  rm -rf build-lib32
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  meson setup build-lib32 \
    --prefix=/usr \
    --libdir=lib32 \
    --buildtype=release \
    -Dc_args='-m32' \
    -Dc_link_args='-m32' \
    -Dcpp_args='-m32' \
    -Dcpp_link_args='-m32' \
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

  ninja -C build-lib32
}

package() {
  cd mesa
  DESTDIR="$pkgdir" ninja -C build-lib32 install
  install -dm755 "$pkgdir/usr/lib32"
  install -Dm644 docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Skip common files installed by MESA
  rm -rf "$pkgdir"/usr/share/drirc.d

  # Rename lib32 json file to avoid conflict with vulkan-terakan-git
  # These files contain absolute paths to their library driver
  mv "$pkgdir"/usr/share/vulkan/icd.d/terascale_icd.x86_64.json \
     "$pkgdir"/usr/share/vulkan/icd.d/terascale_icd.i686.json
}
