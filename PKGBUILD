# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=garnet
pkgver=1.0.49
pkgrel=1
pkgdesc='A high-performance cache-store from Microsoft Research'
arch=('x86_64')
url='https://microsoft.github.io/garnet'
license=('MIT')
_dotnet_ver=8.0
makedepends=("dotnet-sdk-$_dotnet_ver")
options=('!strip' '!debug')
backup=('etc/garnet/garnet-server.conf')
source=(
  "https://github.com/microsoft/garnet/archive/refs/tags/v$pkgver.tar.gz"
  'garnet-server.service'
  'garnet-server.conf'
)
b2sums=('568f79cded4c0d7bd44fff14abfc42195b3219dc10592bba203c072a4ea58c1be6da09c2a2f279635b9063e628ad100ccd4769ccb07cf5b6a8c8028a03a3c652'
        '3db262540ecd4c4474e5fd506ec807b80e73105415e0714cf1a33bfd4221e6722ce22c099eb83dffea8c5baf1162768804b6ba374fd6693958af9d36f51e1ebe'
        '44fd9bd48e28ade45d27095603457afbb67acfb33cfdb14ff71dbdea85830d73d494b438b6b391b8413d15b2acfe00959bd69262e49d331a561b747e385f08b1')

build() {
  cd "$srcdir/garnet-$pkgver/main/GarnetServer"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_NOLOGO=1

  dotnet publish GarnetServer.csproj -p:PublishProfile=linux-x64-based "-f:net$_dotnet_ver" -p:EnableSourceLink=false -p:EnableSourceControlManagerQueries=false
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" garnet-server.service
  install -Dm644 -t "$pkgdir/etc/garnet" garnet-server.conf


  cd "$srcdir/garnet-$pkgver/main/GarnetServer/bin/Release/net$_dotnet_ver"
  mkdir "$pkgdir/usr/lib/garnet"
  install -Dm755 -t "$pkgdir/usr/lib/garnet" publish/linux-x64/GarnetServer
  install -Dm644 -t "$pkgdir/usr/lib/garnet" linux-x64/liblua54.so
  install -Dm644 -t "$pkgdir/usr/lib/garnet" linux-x64/runtimes/linux-x64/native/libnative_device.so

  mkdir "$pkgdir/usr/bin"
  ln -sr "$pkgdir/usr/lib/garnet/GarnetServer" "$pkgdir/usr/bin/GarnetServer"
}
