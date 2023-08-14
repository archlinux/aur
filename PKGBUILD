# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=qbittorrent-cli
pkgver=1.7.23016.1
pkgrel=3
pkgdesc='Command line interface for qBittorrent'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff5c53b50383c0eb478d485981556ed350645f8e8bf380630b1b0c7d3794cf32')
options=('!strip')

prepare() {
  cd "${pkgname}-${pkgver}/src/QBittorrent.CommandLineInterface"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  dotnet restore --use-current-runtime
}

build() {
  cd "${pkgname}-${pkgver}/src/QBittorrent.CommandLineInterface"
  dotnet build --no-restore -c Release -f net6 --no-self-contained --use-current-runtime "/p:Version=${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}/src/QBittorrent.CommandLineInterface"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  dotnet publish --no-build --no-restore -c Release -f net6 --no-self-contained --use-current-runtime --output "${pkgdir}/usr/lib/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -st "${pkgdir}/usr/bin" "/usr/lib/${pkgname}/qbt"
}
