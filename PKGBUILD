# Maintainer: js6pak <kubastaron@hotmail.com>

pkgname=depotdownloader-git
pkgver=2.4.7.r19.g792e77d9
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library"
arch=('x86_64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL2')
depends=('dotnet-runtime-7.0')
makedepends=('git' 'dotnet-sdk>=7')
provides=("${pkgname%-git}")

options=("!strip")
source=("git+${url}.git")
sha256sums=('SKIP')

_tfm="net7.0"

pkgver() {
  cd "DepotDownloader"

  git describe --long --tags | sed -e 's/^DepotDownloader_//g' -e 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Allow building with a newer dotnet sdk
  rm -f "DepotDownloader/global.json"
}

build() {
  cd "DepotDownloader/DepotDownloader"

  dotnet restore -p:TargetFramework=$_tfm
  dotnet publish -p:TargetFrameworks=$_tfm -f $_tfm \
    -r linux-x64 -c Release \
    -p:PublishSingleFile=true --no-self-contained -p:IncludeAllContentForSelfExtract=true -p:DebugType=embedded
}

package() {
  cd "DepotDownloader/DepotDownloader"

  install -D -m755 "bin/Release/$_tfm/linux-x64/publish/DepotDownloader" "$pkgdir/usr/bin/depotdownloader"
}
