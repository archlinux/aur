# Maintainer: Holden Lewis <holdenplewis at gmail dot com>

pkgname=impostor-server
pkgver=1.1.0
pkgrel=1
pkgdesc='Unofficial dedicated server for Among Us.'
url='https://aeonlucid.com/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=('zlib' 'krb5')
makedepends=('git' 'dotnet-sdk' 'lttng-ust')
provides=('impostor-server')
conflicts=('impostor-server')
options=('!strip')
source=("git+https://github.com/AeonLucid/Impostor.git#tag=v${pkgver}"
        "git+https://github.com/AeonLucid/Hazel-Networking.git"
        "https://dot.net/v1/dotnet-install.sh")
sha512sums=('SKIP'
            'SKIP'
            '7cdf91eda30e18ae3042ea77ad2a43e66e5a020df1ae09ff0b73f327385a34b51da3cd52361ef2714c853d30fffc8dd077733858b07ec6f79a444b6d8dcf637c')

prepare() {
  chmod +x ./dotnet-install.sh
  ./dotnet-install.sh --install-dir /usr/share/dotnet -channel Current -version 5.0.100-rc.1.20452.10

  cd "Impostor/"
  git submodule init
  git config submodule.submodules/Hazel-Networking.url ${srcdir}/Hazel-Networking
  git submodule update
}

build() {
  cd "Impostor/"

  dotnet restore ./src
  dotnet publish -c release -o ./build/linux-x64 -f net5.0 -r linux-x64 --self-contained --no-restore ./src/Impostor.Server/Impostor.Server.csproj /p:PublishSingleFile=true
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"

  cp --verbose "${srcdir}/Impostor/build/linux-x64/Impostor.Server" "${pkgdir}/usr/bin/impostor-server"
}
