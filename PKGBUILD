# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=airsim
pkgver=1.7.0
pkgrel=1
pkgdesc="Open source simulator for autonomous vehicles built on Unreal Engine /
Unity, from Microsoft AI & Research"
url="https://microsoft.github.io/AirSim"
arch=(x86_64)
license=('MIT')
depends=(unreal-engine rpclib eigen)
makedepends=(cmake gcc)
_pkgname=AirSim
source=("${pkgname}-${pkgver}::https://github.com/microsoft/AirSim/archive/v$pkgver-linux.tar.gz"
        "CMakeLists.patch")
sha256sums=("77d9b9eb771883222bedd611fe52ccbef074bbb8f5fd91fd2b55388ea10647a8"
            "6128b8042c5394cfea443e06da3fad1ce63da84082f1f6a027906026987dfe9c")

prepare() {
    patch -s -p0 < CMakeLists.patch
}

build() {
  mkdir -p "$srcdir/${_pkgname}-${pkgver}-linux/cmake/build"
  cd "$srcdir/${_pkgname}-${pkgver}-linux/cmake/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/opt" ..
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}-linux/cmake/build"

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
