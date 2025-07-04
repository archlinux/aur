# Maintainer: js6pak <me@6pak.dev>

pkgname=depotdownloader-git
pkgver=3.4.0.r3.g5d6950a
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library"
arch=('x86_64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL2')
depends=('dotnet-runtime-9.0')
makedepends=('git' 'dotnet-sdk>=9')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

options=("!strip")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "DepotDownloader"

  git describe --long --tags | sed -e 's/^DepotDownloader_//g' -e 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "DepotDownloader/DepotDownloader"

  dotnet publish \
    -r linux-x64 -c Release \
    -p:PublishSingleFile=true --no-self-contained -p:IncludeAllContentForSelfExtract=true -p:DebugType=embedded
}

package() {
  cd "DepotDownloader/DepotDownloader"

  install -D -m755 bin/Release/*/*/publish/DepotDownloader "$pkgdir/usr/bin/depotdownloader"
}
