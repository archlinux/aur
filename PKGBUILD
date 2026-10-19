# Maintainer: Felitendo
# Contributor: Pittore Studio
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=pittore-studio
pkgver=0.1.6
pkgrel=1
pkgdesc="Layer-based photo editor for Linux"
arch=('x86_64')
url="https://github.com/Event-Horizon-desktop-environment/pittore-studio"
license=('MIT')
# Upstream's own list (packaging/arch/PKGBUILD), checked by pkg.sh on every
# new version. lcms2 is required, not optional: without it meson drops the
# Qt application target.
depends=('fontconfig' 'freetype2' 'harfbuzz' 'lcms2' 'libjpeg-turbo' 'libtiff'
         'libwebp' 'qrencode' 'qt6-base' 'qt6-svg' 'tomlplusplus' 'zlib' 'zstd')
# the HIP backend is a plugin, dlopened once the runtime is installed
optdepends=('hip-runtime-amd: AMD GPU compute backend (ROCm HIP runtime)')
# cuda and hip-runtime-amd carry nvcc and hipcc; meson looks in /opt/cuda/bin
# and /opt/rocm/bin, so neither has to be on PATH. Both are build-time only:
# the CUDA runtime is linked statically and HIP is dlopened at runtime.
makedepends=('cuda' 'hip-runtime-amd' 'meson' 'ninja' 'pkgconf')
# !lto: makepkg's -flto makes BFD ld fail the final link with "copy relocation
# against non-copyable protected symbol" on Qt6's staticMetaObject symbols
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df5e251718e1e7bdb1b96d8096d62a5f63557c1db63b45f0b011bbbebd172768')

build() {
  # The GPU target lists are upstream's own, from the build that produces the
  # release assets. The "native" default would probe the build machine's card,
  # which needs a driver present and ties the package to that one GPU.
  meson setup build "$pkgname-$pkgver" --prefix=/usr -Dbuildtype=release \
    -Dbackend-cuda=enabled \
    -Dcuda-archs=sm_75,sm_80,sm_86,sm_89,sm_90,sm_100,sm_120,+ptx \
    -Dbackend-hip=enabled \
    -Dhip-archs=gfx906,gfx908,gfx90a,gfx942,gfx950,gfx1010,gfx1012,gfx1030,gfx1031,gfx1032,gfx1100,gfx1101,gfx1102,gfx1103,gfx1150,gfx1151,gfx1200,gfx1201 \
    -Donnxruntime=disabled -Dapp=enabled
  # Only what gets installed. Building everything would pull in the test tree,
  # which compiles app_state.cpp (~1GB per translation unit) into every test
  # binary.
  ninja -C build src/app/painter src/app/pittore-mcp \
    src/engine/compute/libpittore-hip.so
}

package() {
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
  # upstream's meson install ships no license text
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
