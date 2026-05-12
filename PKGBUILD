# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

_pkgname=dusklight
pkgname=${_pkgname}-git
pkgver=1.0.1.r11.g61b2e6c
pkgrel=1
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusk"
license=('CC0-1.0')
depends=(libjpeg-turbo glibc libgcc sdl3 abseil-cpp freetype2 libstdc++ bash)
makedepends=(git cmake ninja llvm vulkan-headers python python-markupsafe clang lld alsa-lib libpulse libxrandr patchelf)
replaces=(tp-dusk-git)
source=(
  "git+$url"
  "git+https://github.com/encounter/aurora.git"
  "launcher.sh"
)

sha256sums=('SKIP'
            'SKIP'
            '5e7de2d2280b48efa543dc9a0484d9af6a18d6d881833deb4ca333072bc46aa0')

pkgver() {
	cd "$srcdir/dusk"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd dusk

  git submodule init
  git config submodule.extern/aurora.url "$srcdir/aurora"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/dusk"

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
  install -Dm 755 "${srcdir}/dusk/build/dusklight" "${pkgdir}/usr/share/${_pkgname}/dusklight"
  install -Dm 755 "launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"
  cp -r "${srcdir}/dusk/res" "${pkgdir}/usr/share/${_pkgname}/res"

  install -Dm 644 "${srcdir}/platforms/freedesktop/1024x1024/apps/dusklight.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm 755 "${srcdir}/platforms/freedesktop/dusklight.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  patchelf --remove-rpath "${pkgdir}/usr/share/${_pkgname}/dusk"
}
