# Maintainer: js6pak <kubastaron@hotmail.com>

pkgname=depotdownloader-git
pkgver=2.4.0.r12.gcb5c6c8a
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library"
arch=('x86_64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL2')
depends=('dotnet-runtime>=3.1')
makedepends=('git' 'dotnet-sdk>=3.1')
provides=("${pkgname%-git}")

options=("!strip")
source=("git+${url}.git" 'DepotDownloader.csproj.patch')
sha256sums=('SKIP' '792094891d26a81208982a4e773915aae300b203ea2acd183476d9f593523541')

pkgver() {
  cd "DepotDownloader"

  git describe --long --tags | sed -e 's/^DepotDownloader_//g' -e 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "DepotDownloader/DepotDownloader"

  patch --input="${srcdir}/DepotDownloader.csproj.patch"
}

build() {
  cd "DepotDownloader/DepotDownloader"

  dotnet publish -r linux-x64 -c Release -p:PublishSingleFile=true --no-self-contained
}

package() {
  cd "DepotDownloader/DepotDownloader"

  install -D -m755 "bin/Release/netcoreapp3.1/linux-x64/publish/DepotDownloader" "$pkgdir/usr/bin/depotdownloader"
}
