# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-hexen
pkgver=8.2
pkgrel=1
pkgdesc="Small, functional and simple Hexen source port, created with help, efforts and bits of code from people around the world"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth')
makedepends=(cmake)
optdepends=('hexen1-wad: Hexen demo game data')
conflicts=('inter-hexen-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/international-doom/archive/refs/tags/${pkgver}.tar.gz"
        001_install_rule.patch)
b2sums=('87c596d96a18c0643eb69a318e259fa36458ec6bb1aa9e735aa9721400854400d339535ba51f9597724bc0721d3e50c96c2e6595ba9ada99fb9c173a09782736'
        '1007bef14a04e672c091af687c6c93d555dfffcaf346100d066b280b8a1334b8e585121c89eb9f78fb1f6fa610f7fae5e6d0d13c3f6a2088119b7c116c703434')

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
    cmake --build build --target inter-hexen inter-setup
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-hexen-setup"
    install -Dm644 "international-doom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "international-doom-${pkgver}/data/hexen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-hexen.png"
    install -Dm644 "international-doom-${pkgver}/data/hexen.desktop" "${pkgdir}/usr/share/applications/inter-hexen.desktop"
}
