# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=8.1
pkgrel=1
pkgdesc="Small, functional and simple Heretic source port, created with help, efforts and bits of code from people around the world"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth')
makedepends=(cmake)
optdepends=('heretic1-wad: Heretic shareware game data')
conflicts=('inter-heretic-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/international-doom/archive/refs/tags/${pkgver}.tar.gz"
        001_install_rule.patch)
b2sums=('058c6cf6d1afde57a7b8a628006aee1359fb85e975777f675517cd83fbe809fd160003122189f6effba1f6fb53c7ec78a767823d1298eddb4e5d569a2702a160'
        '192d399a83f8e5428909f8100eaab6df52da4e22ef1f0fcb171b38b7287a700c891b3f8bab83ba57691b7ab0af74c86973c67eb22831ab566f1ce4a7bbec7591')

prepare() {
  cd "international-doom-${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
    cmake -S "international-doom-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build build --target inter-heretic inter-setup
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-heretic-setup"
    install -Dm644 "international-doom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
