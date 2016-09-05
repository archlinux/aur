# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=steamkit
pkgver=1.8.0
pkgrel=1
pkgdesc="A .NET library designed to interoperate with Valve's Steam network"
arch=('any')
url="https://github.com/SteamRE/SteamKit"
license=('LGPL2.1')
depends=('mono' 'protobuf-net')
# Mono >= 4.4 segfaults during the preparations for signing the assembly
makedepends=('mono<4.4')
options=('!strip')
source=("https://github.com/SteamRE/SteamKit/archive/SteamKit_${pkgver}.tar.gz")
md5sums=('9e88ec62a9c9013f8e4096b19e388deb')

build() {
  cd "${srcdir}/SteamKit-SteamKit_${pkgver}/SteamKit2/SteamKit2"

  xbuild SteamKit2.csproj /p:Configuration=Release

  cd "bin/Release"
  monodis SteamKit2.dll --output=SteamKit2.il
  sn -k 1024 SteamKit2.snk
  ilasm /dll /key:SteamKit2.snk SteamKit2.il
}

package() {
  cd "${srcdir}/SteamKit-SteamKit_${pkgver}/SteamKit2/SteamKit2/bin/Release"

  install -Dm644 SteamKit2.dll "${pkgdir}/usr/lib/SteamKit/SteamKit2.dll"
  install -Dm644 SteamKit2.dll.mdb "${pkgdir}/usr/lib/SteamKit/SteamKit2.dll.mdb"

  gacutil -i SteamKit2.dll -root "${pkgdir}/usr/lib"
}

