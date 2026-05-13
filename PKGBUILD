# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=tp-dusk
pkgver=1.1.0
pkgrel=1
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=(libjpeg-turbo glibc libgcc sdl3 abseil-cpp freetype2 libstdc++ bash)
makedepends=(git cmake ninja llvm vulkan-headers python python-markupsafe clang lld alsa-lib libpulse libxrandr patchelf)
source=(
  "git+$url#tag=v${pkgver}"
  "git+https://github.com/encounter/aurora.git"
  "launcher.sh"
)

sha256sums=('ef056bdf3f5362bae86ba8a267e40b0a18d4bcef2abe30e0769e25da4a9c59d7'
            'SKIP'
            '5e7de2d2280b48efa543dc9a0484d9af6a18d6d881833deb4ca333072bc46aa0')

prepare() {
  cd dusklight

  git submodule init
  git config submodule.extern/aurora.url "$srcdir/aurora"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/dusklight"

  cmake -B build -GNinja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
    -DCMAKE_C_FLAGS="${CFLAGS} -flto=thin -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin -DNDEBUG" \
    -DDUSK_ENABLE_UPDATE_CHECKER=OFF

  cmake --build build
}

package() {
  install -Dm 755 "${srcdir}/dusklight/build/dusklight" "${pkgdir}/usr/share/dusklight/dusklight"
  install -Dm 755 "launcher.sh" "${pkgdir}/usr/bin/dusklight"
  cp -r "${srcdir}/dusklight/res" "${pkgdir}/usr/share/dusklight/res"

  install -Dm 644 "${srcdir}/dusklight/platforms/freedesktop/1024x1024/apps/dusklight.png" "${pkgdir}/usr/share/pixmaps/dusklight.png"
  install -Dm 755 "${srcdir}/dusklight/platforms/freedesktop/dusklight.desktop" "${pkgdir}/usr/share/applications/dusklight.desktop"

  patchelf --remove-rpath "${pkgdir}/usr/share/dusklight/dusklight"
}
