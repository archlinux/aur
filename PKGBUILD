# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=steamkit
pkgver=1.6.2
pkgrel=1
pkgdesc="A .NET library designed to interoperate with Valve's Steam network. It aims to provide a simple, yet extensible, interface to perform various actions on the network."
arch=('any')
url="https://github.com/SteamRE/SteamKit"
license=('LGPL2.1')
depends=('mono' 'protobuf-net')
options=('!strip')
source=("https://github.com/SteamRE/SteamKit/archive/SteamKit_${pkgver}.tar.gz")
md5sums=('4c2fe9cc8725e3b080b33c366e558784')

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
  
  install -Dm644 SteamKit2.dll "$pkgdir/usr/lib/SteamKit/SteamKit2.dll"
  install -Dm644 SteamKit2.dll.mdb "$pkgdir/usr/lib/SteamKit/SteamKit2.dll.mdb"
  install -Dm644 changes.txt "$pkgdir/usr/lib/doc/SteamKit/changes.txt"
  
  gacutil -i SteamKit2.dll -root "$pkgdir/usr/lib"
}
  
