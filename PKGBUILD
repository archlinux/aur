# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=dusklight
pkgname=${_pkgname}-git
pkgver=1.3.1.r76.g7c5ed6a
pkgrel=4
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=(libpng zlib libjpeg-turbo glibc libgcc sdl3 abseil-cpp freetype2 libstdc++)
makedepends=(git cmake ninja llvm vulkan-headers python python-markupsafe clang lld alsa-lib libpulse libxrandr)
replaces=(tp-dusk-git)
conflicts=(dusklight dusklight-bin)
source=(
  "git+$url"
  "git+https://github.com/encounter/aurora.git"
  "0001-Fixed-using-system-fmt.patch"
)

sha256sums=('SKIP'
            'SKIP'
            'bc762592c46d0b6dd41aa2c8d4beff2626246d2e600698c8a45997ed7f54aead')

pkgver() {
	cd "${srcdir}/dusklight"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "${srcdir}/dusklight"

  git submodule init
  git config submodule.extern/aurora.url "${srcdir}/aurora"
  git -c protocol.file.allow=always submodule update

  cd "extern/aurora"
  git apply "${srcdir}/0001-Fixed-using-system-fmt.patch"
}

build() {
  cd "${srcdir}/dusklight"

  cmake -B build -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
    -DCMAKE_C_FLAGS="${CFLAGS} -flto=thin -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin -DNDEBUG" \
    -DDUSK_ENABLE_UPDATE_CHECKER=OFF \
    -DDUSK_PACKAGE_INSTALL=ON

  cmake --build build
}

package() {
  install -dm 755 "${pkgdir}/usr/bin"

  install -Dm 755 "${srcdir}/dusklight/build/dusklight" "${pkgdir}/opt/${_pkgname}/dusklight"
  install -Dm 755 "${srcdir}/dusklight/build/libs/freeverb/libfreeverb.so" "${pkgdir}/opt/${_pkgname}/libfreeverb.so"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/dusklight/res" "${pkgdir}/usr/share/${_pkgname}/res"
  ln -s /opt/${_pkgname}/dusklight "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 "${srcdir}/dusklight/platforms/freedesktop/1024x1024/apps/dev.twilitrealm.dusk.png" "${pkgdir}/usr/share/pixmaps/dev.twilitrealm.dusk.png"
  install -Dm 755 "${srcdir}/dusklight/platforms/freedesktop/dev.twilitrealm.dusk.desktop" "${pkgdir}/usr/share/applications/dev.twilitrealm.dusk.desktop"
}
