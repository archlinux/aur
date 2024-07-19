# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=colosseum
pkgver=2.2.0
pkgrel=1
pkgdesc="Open source simulator for autonomous robotics built on Unreal Engine with support for Unity"
url="https://codexlabsllc.github.io/Colosseum/"
arch=(x86_64)
license=('MIT')
depends=(unreal-engine rpclib eigen)
makedepends=(cmake gcc)
_pkgname=Colosseum
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CodexLabsLLC/Colosseum/archive/v$pkgver.tar.gz"
        "CMakeLists.patch")
sha256sums=("a817c4a17101b56e0d01f7b5706744110212607a6bc8fb40bb5b84fd03ada24b"
            "6128b8042c5394cfea443e06da3fad1ce63da84082f1f6a027906026987dfe9c")

prepare() {
   patch -s -p0 < CMakeLists.patch
}

build() {
  mkdir -p "$srcdir/${_pkgname}-${pkgver}/cmake/build"
  cd "$srcdir/${_pkgname}-${pkgver}/cmake/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/opt" ..
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/cmake/build"

  msg "Installing files"

  # AirLib
  mkdir -p ${pkgdir}/opt/${pkgname}/AirLib/lib/x64/Release
  cp output/lib/libAirLib.a ${pkgdir}/opt/${pkgname}/AirLib/lib
  cp -r output/lib/ ${pkgdir}/opt/${pkgname}/AirLib/lib/x64/Release

  # MavLinkCom
  mkdir -p ${pkgdir}/opt/${pkgname}/AirLib/deps/MavLinkCom/lib
  cp output/lib/libMavLinkCom.a ${pkgdir}/opt/${pkgname}/AirLib/deps/MavLinkCom/lib
  cp -r ../../MavLinkCom/include ${pkgdir}/opt/${pkgname}/AirLib/deps/MavLinkCom

  # Unreal
  mkdir -p ${pkgdir}/opt/${pkgname}/Unreal/Plugins/AirSim/Source
  cp -r ../../AirLib ${pkgdir}/opt/${pkgname}/Unreal/Plugins/AirSim/Source
  mkdir -p ${pkgdir}/opt/${pkgname}/Unreal/Environments/Blocks/Plugins
  cp -r ../../Unreal/Plugins/AirSim ${pkgdir}/opt/${pkgname}/Unreal/Environments/Blocks/Plugins
}
