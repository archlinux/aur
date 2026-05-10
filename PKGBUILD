# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=tp-dusk
pkgname=${_pkgname}-git
pkgver=r3996.c948bffd32
pkgrel=1
pkgdesc="Dusk is a reverse-engineered reimplementation of Twilight Princess."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusk"
license=('CC0-1.0')
depends=(libjpeg-turbo glibc curl libgcc sdl3 abseil-cpp freetype2 libstdc++)
makedepends=(cmake ninja llvm vulkan-headers python python-markupsafe clang lld alsa-lib libpulse libxrandr)
provides=(tp-dusk)
conflicts=(tp-dusk)
source=(
  "git+$url"
  "git+https://github.com/encounter/aurora.git"
  "launcher.sh"
  "tp-dusk.desktop"
)

sha256sums=('SKIP'
            'SKIP'
            '9bcacbd0a3da8a4149dd8cc4b904f3e9df6af59eb86de5cd6ece1f6ee1179ad5'
            '1e6547cf4dd69f0ecb6895733dcd13f3e265c6267298c7bf83dd6acbad42fda5')

pkgver() {
	cd "$srcdir/dusk"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd dusk

  git submodule init
  git config submodule.extern/aurora.url "$srcdir/aurora"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/dusk"

  cmake --preset linux-default-relwithdebinfo
  cmake --build --preset linux-default-relwithdebinfo
}

package() {
  install -Dm 755 "launcher.sh" "${pkgdir}/usr/bin/tp-dusk"

  install -Dm 755 "${srcdir}/dusk/build/linux-default-relwithdebinfo/dusk" "${pkgdir}/usr/share/tp-dusk/dusk"
  cp -r "${srcdir}/dusk/res" "${pkgdir}/usr/share/tp-dusk/res"

  install -Dm 644 "${srcdir}/dusk/res/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm 755 "tp-dusk.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop" 
}
