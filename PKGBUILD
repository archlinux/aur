# Maintainer: Felitendo
# Contributor: Pittore Studio
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=pittore-studio-git
pkgver=0.1.6.r1.gc97f85d
pkgrel=1
pkgdesc="Layer-based photo editor for Linux (git)"
arch=('x86_64')
url="https://github.com/Event-Horizon-desktop-environment/pittore-studio"
license=('MIT')
# Same build as pittore-studio, see that package for the lists and the flags.
depends=('fontconfig' 'freetype2' 'harfbuzz' 'lcms2' 'libjpeg-turbo' 'libtiff'
         'libwebp' 'qrencode' 'qt6-base' 'qt6-svg' 'tomlplusplus' 'zlib' 'zstd')
optdepends=('hip-runtime-amd: AMD GPU compute backend (ROCm HIP runtime)')
makedepends=('cuda' 'git' 'hip-runtime-amd' 'meson' 'ninja' 'pkgconf')
# !lto: makepkg's -flto makes BFD ld fail the final link with "copy relocation
# against non-copyable protected symbol" on Qt6's staticMetaObject symbols
options=('!lto')
provides=('pittore-studio')
conflicts=('pittore-studio')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # --tags: upstream's release tags are lightweight, so a plain describe finds
  # nothing. --match keeps the rolling and latest tags from swallowing it.
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  # The GPU target lists are upstream's own, from the build that produces the
  # release assets. The "native" default would probe the build machine's card,
  # which needs a driver present and ties the package to that one GPU.
  meson setup build "$pkgname" --prefix=/usr -Dbuildtype=release \
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
  install -Dm644 "$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
