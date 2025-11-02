# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Bao Trinh <qubidt@gmail.com>

pkgname=qbittorrent-cli
pkgver=1.8.24285.1
pkgrel=1
pkgdesc='Command line interface for qBittorrent'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b32f912d854550cdf3523b7c75f8fc9e8201a6c2b8a7d5f217c438e2e7e6af1b')
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
