# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=7.1
pkgrel=1
pkgdesc="Small, functional and simple Heretic source port, created with help, efforts and bits of code from people around the world"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth>=2.2.0')
makedepends=(cmake)
optdepends=('heretic1-wad: Heretic shareware game data')
conflicts=('inter-heretic-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/7.5.tar.gz"
        001_install_rule.patch)
b2sums=('1bee87ea72cd367872808b632ddded5c58fc9b10aa8723751cf28f8f22b5388f3797ba117e914678a6060c4f68dee0ab69e9ed5b671ddfda62cc0f74fefbd000'
        '192d399a83f8e5428909f8100eaab6df52da4e22ef1f0fcb171b38b7287a700c891b3f8bab83ba57691b7ab0af74c86973c67eb22831ab566f1ce4a7bbec7591')

prepare() {
  cd "international-doom-7.5"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
    cmake -S "international-doom-7.5" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build build --target inter-heretic inter-setup
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-heretic-setup"
    install -Dm644 "international-doom-7.5/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
