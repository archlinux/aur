# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=tp-dusk
pkgver=1.1.1
pkgrel=2
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

sha256sums=('c635abbf7170d74773d5382f1f13a086044d9e0da45804584a215267772d07e9'
            'SKIP'
            '71e621f84d9747788b55e02354e984e327dfaf23df151232067284443e81714a')

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
