# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: ROllerozxa (temporaryemail4meh [gee mail])

_name=minecraft-c
pkgname="${_name}"
pkgver=1.2
pkgrel=2
pkgdesc="Minecraft Classic 0.0.30a reimplemented in C."
arch=(x86_64)
url="https://github.com/johnpayne-dev/MinecraftC"
license=('MIT')
conflicts=("${_name}-git")
depends=('sdl3' 'sdl2-compat' 'stb' 'glu')
makedepends=('git' 'clang' 'libcute_sound-sdl2')

source=(
  "${_name}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=('2c5682a8a9dc3a16d37f28e9ecc82030c206b4085cfbeae40f6c9244468240d0'
            '4504a6a07413bea5c9adc205b8a4d9b67b49bf86ff7439618a3c461f63762d43'
            '8d918bb8629763b293ecf8946abf1d7184ff2b4c017a5639f824eaba1573df1c')

_rootdir="MinecraftC-${pkgver}"

build() {
  cd "${_rootdir}"
  
  # Building
  mkdir -p Output
  
  clang \
    MinecraftC/*.c \
    MinecraftC/GUI/*.c \
    MinecraftC/Level/*.c \
    MinecraftC/Level/Generator/*.c \
    MinecraftC/Level/Tile/*.c \
    MinecraftC/Level/Generator/Noise/*.c \
    MinecraftC/Particle/*.c \
    MinecraftC/Physics/*.c \
    MinecraftC/Player/*.c \
    MinecraftC/Render/*.c \
    MinecraftC/Render/Texture/*.c \
    MinecraftC/Sound/*.c \
    MinecraftC/Utilities/*.c \
    -lm -lSDL2 -lGL -lGLU -O2 \
    -I"/usr/include/SDL2/" \
    -I"/usr/include/stb/" \
    -o Output/MinecraftC
}

package() {
  cd "$srcdir"
  install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
  install -Dm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

  cd "${_rootdir}"
  install -Dm755 "Output/MinecraftC" "${pkgdir}/usr/bin/MinecraftC"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

