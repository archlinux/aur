# Maintainer: Holden Lewis <holdenplewis at gmail dot com>

pkgname=impostor-server
pkgver=1.1.0
pkgrel=4
pkgdesc='Unofficial dedicated server for Among Us.'
url='https://impostor.github.io/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=('zlib' 'krb5')
makedepends=('git' 'dotnet-sdk' 'lttng-ust')
options=('!strip')
source=("git+https://github.com/Impostor/Impostor.git#tag=v${pkgver}"
        "git+https://github.com/AeonLucid/Hazel-Networking.git"
        "https://dot.net/v1/dotnet-install.sh"
        "impostor.service")
sha512sums=('SKIP'
            'SKIP'
            'ffbcb792bc25976322c18189d8884bbddd8e0fdc216a0e541b8a28baf4791001cb6cd114bb2935190df8cfe95fc909cc87b64e87d8f1f3d0a77e0fd2f4a1f43e'
            'b1360d6aa5cd769ee7dbdb32148f7e1786acdb6a3080b67a48328252af8cc18ff3448a46f04e656993d891a578217599de96a80e96d7da57f95b107d451fdfaa')

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
  mkdir -p "${pkgdir}/etc/impostor/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  cp --verbose "${srcdir}/Impostor/build/linux-x64/Impostor.Server" "${pkgdir}/usr/bin/impostor-server"
  cp --verbose "${srcdir}/Impostor/build/linux-x64/config.json" "${pkgdir}/etc/impostor/"
  cp --verbose "${srcdir}/impostor.service" "${pkgdir}/usr/lib/systemd/system/"
}
