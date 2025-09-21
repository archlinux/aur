# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=8.3
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
b2sums=('c465ccdbc3cb2a0ace4033cb009dc3852feee1864e75aabe88f9e6e5c18476d0832855b46f819ec9486862e1288c375f504d6cae6f2dacab9e56cf53f63a0a24'
        '5cb1da155e244d310b8dd1fab0af319d659e4181ea2a65081c047a2fbeb09d9f9c113ee6d9b8bf70ffbd4b1cd6124135e63298c6991ac847abb4d1d4aa7e27d1')

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
    cmake -S "international-doom-${pkgver}" -B "build-${pkgver}-${pkgrel}" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build "build-${pkgver}-${pkgrel}" --target inter-heretic inter-setup
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build-${pkgver}-${pkgrel}"
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-heretic-setup"
    install -Dm644 "international-doom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "international-doom-${pkgver}/data/heretic.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-heretic.png"
    install -Dm644 "international-doom-${pkgver}/data/heretic.desktop" "${pkgdir}/usr/share/applications/inter-heretic.desktop"
}
