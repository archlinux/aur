# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom
pkgver=8.0
pkgrel=1
pkgdesc="Small, functional and simple Doom source port, created with help, efforts and bits of code from people around the world"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth')
makedepends=(cmake)
optdepends=('doom1-wad: Doom shareware game data')
conflicts=('inter-doom-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/international-doom/archive/refs/tags/${pkgver}.tar.gz"
        001_install_rule.patch)
b2sums=('757b1192d3436f0ec750be20a4c3b4397ed55ead374ac513796d7a1256002e37445523a79e8e4efaf9a7fded955c6fdd81ca362a25f77df54eba19115179d008'
        '431d360f7a6fe903fdae293d4bd217d90a6153e7f8093d313e4ce7e1be36a0abe535e3333fb21467d1d5c4ade6055ab268a25585f267566345c20fb6d3381979')

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
    cmake --build build --target inter-doom inter-setup
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-doom-setup"
    install -Dm644 "international-doom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
