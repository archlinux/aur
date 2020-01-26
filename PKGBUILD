# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=airsim
pkgver=1.2.2
pkgrel=1
pkgdesc="Open source simulator for autonomous vehicles built on Unreal Engine /
Unity, from Microsoft AI & Research"
url="https://microsoft.github.io/AirSim"
arch=(x86_64)
license=('MIT')
depends=(unreal-engine rpclib eigen)
makedepends=(cmake gcc)
_pkgname=AirSim
source=("https://github.com/microsoft/AirSim/archive/v.$pkgver.tar.gz"
        "CMakeLists.patch")
sha256sums=("5fca7fc84bd3b90d05a8c7739f6379a874fb727612c462a68b2becae0822ea86"
            "2c57560538b9f284308e9dc7f782497b4d2473493e7f0aae50475c82ff99d4de")

prepare() {
    #mv CMakeLists.patch ${srcdir}
    patch -s -p0 < CMakeLists.patch || return 1
}

build() {
  mkdir -p "$srcdir/${_pkgname}-v.${pkgver}/cmake/build"
  cd "$srcdir/${_pkgname}-v.${pkgver}/cmake/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/opt" \
        ..
  make
}

package() {
  cd "$srcdir/${_pkgname}-v.${pkgver}/cmake/build"

  msg "Installing files"

  # AirLib
  mkdir -p ${pkgdir}/opt/airsim/AirLib/lib/x64/Release
  cp output/lib/libAirLib.a ${pkgdir}/opt/airsim/AirLib/lib
  cp -r output/lib/ ${pkgdir}/opt/airsim/AirLib/lib/x64/Release

  # MavLinkCom
  mkdir -p ${pkgdir}/opt/airsim/AirLib/deps/MavLinkCom/lib
  cp output/lib/libMavLinkCom.a ${pkgdir}/opt/airsim/AirLib/deps/MavLinkCom/lib
  cp -r ../../MavLinkCom/include ${pkgdir}/opt/airsim/AirLib/deps/MavLinkCom

  # Unreal
  mkdir -p ${pkgdir}/opt/airsim/Unreal/Plugins/AirSim/Source
  cp -r ../../AirLib ${pkgdir}/opt/airsim/Unreal/Plugins/AirSim/Source
  mkdir -p ${pkgdir}/opt/airsim/Unreal/Environments/Blocks/Plugins
  cp -r ../../Unreal/Plugins/AirSim ${pkgdir}/opt/airsim/Unreal/Environments/Blocks/Plugins

}
