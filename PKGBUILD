# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mr.Smith1974

pkgname=openloco
pkgver=24.03
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
        "https://github.com/OpenLoco/OpenLoco/commit/dd06576a7191d13366e64208c560c6064c26a311.patch"
	    "openloco.desktop")
sha256sums=('72098a0971a51db2a961734b5f9e91f3689e16ad66599ab52dd7ea58d7d2f8bb'
            '1a9e10f2f39ba40e2f9b9979ac8e603ae969567756e33771cad5075151dbd1ee'
            '57512f00144c1e0d2cc91c3adbf38460d5ec1223afc27bd16e1271760bce02ae')
options=(!lto)

prepare() {
  cd "OpenLoco-${pkgver}"
  patch -Np1 -i ../dd06576a7191d13366e64208c560c6064c26a311.patch
}

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
