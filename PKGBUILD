# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

_pkgname=tp-dusk
pkgname=${_pkgname}-git
pkgver=1.0.1.r1.g764fc0b
pkgrel=1
pkgdesc="Dusk is a reverse-engineered reimplementation of Twilight Princess."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusk"
license=('CC0-1.0')
depends=(libjpeg-turbo glibc libgcc sdl3 abseil-cpp freetype2 libstdc++ hicolor-icon-theme bash)
makedepends=(git cmake ninja llvm vulkan-headers python python-markupsafe clang lld alsa-lib libpulse libxrandr patchelf)
source=(
  "git+$url"
  "git+https://github.com/encounter/aurora.git"
  "launcher.sh"
  "tp-dusk.desktop"
)

sha256sums=('SKIP'
            'SKIP'
            'd7fc1497606271498fe7007b526954b671dd22493f33a19b654a9da18eefcce6'
            '1e6547cf4dd69f0ecb6895733dcd13f3e265c6267298c7bf83dd6acbad42fda5')

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

  cmake -B build -S dusk -GNinja \
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
  install -Dm 755 "${srcdir}/build/dusk" "${pkgdir}/usr/lib/${pkgname}/dusk"
  install -Dm 755 "launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -dm 755 "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/dusk/res" "${pkgdir}/usr/share/${pkgname}/res"

  install -Dm 644 "${srcdir}/dusk/res/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
  install -Dm 755 "tp-dusk.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/dusk"
}
