# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mr.Smith1974

pkgname=openloco
pkgver=24.04
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=(x86_64 i686)
url="https://github.com/OpenLoco/OpenLoco"
license=(MIT)
depends=(sdl2 libpng openal)
depends_x86_64+=(lib32-glibc lib32-gcc-libs lib32-sdl2 lib32-libpng lib32-openal lib32-yaml-cpp lib32-fmt)
makedepends=(cmake yaml-cpp gtest fmt git)
makedepends_x86_64+=(lib32-gtest)
optdepends=(
    'lib32-libpipewire: audio output'
    'lib32-libpulse: audio output'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenLoco/OpenLoco/archive/refs/tags/v${pkgver}.tar.gz"
	    "openloco.desktop")
sha256sums=('2141891fc795460e92657aead379a3bdf32069f7f938e42eae4a1e595edd686b'
            '57512f00144c1e0d2cc91c3adbf38460d5ec1223afc27bd16e1271760bce02ae')
options=(!lto)

build() {
  export CXXFLAGS="$CXXFLAGS -m32"
  cmake -G "Unix Makefiles" -B build -S "OpenLoco-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  install -Dm644 "openloco.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  DESTDIR="${pkgdir}" cmake --install build
  install -D "OpenLoco-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
