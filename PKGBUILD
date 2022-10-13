# Maintainer: Sebastian Bach <BastelBach at gmail dot com>

pkgname=impostor-server-git
pkgver=1.7.2
pkgrel=1
pkgdesc='Unofficial dedicated server for Among Us.'
url='https://impostor.github.io/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=('zlib' 'krb5')
makedepends=('git' 'dotnet-sdk>=6.0.0' 'lttng-ust')
options=('!strip')
source=("git+https://github.com/Impostor/Impostor.git"
        "git+https://github.com/AeonLucid/Hazel-Networking.git"
        "impostor.service")
sha512sums=('SKIP'
            'SKIP'
            'b1360d6aa5cd769ee7dbdb32148f7e1786acdb6a3080b67a48328252af8cc18ff3448a46f04e656993d891a578217599de96a80e96d7da57f95b107d451fdfaa')

prepare() {
  #chmod +x ./dotnet-install.sh
  #./dotnet-install.sh --install-dir Impostor/dotnet -channel Current 

  cd "Impostor/"
  git submodule init
  git config submodule.submodules/Hazel-Networking.url ${srcdir}/Hazel-Networking
  git submodule update
}

build() {
  cd "Impostor/"
  dotnet restore ./src
  dotnet publish -c release -o ./build/linux-x64 -f net6.0 -r linux-x64 --self-contained --no-restore ./src/Impostor.Server/Impostor.Server.csproj /p:PublishSingleFile=true
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/impostor/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  cp --verbose "${srcdir}/Impostor/build/linux-x64/Impostor.Server" "${pkgdir}/usr/bin/impostor-server"
  cp --verbose "${srcdir}/Impostor/build/linux-x64/config.json" "${pkgdir}/etc/impostor/"
  cp --verbose "${srcdir}/impostor.service" "${pkgdir}/usr/lib/systemd/system/"
}

pkgver() {
  cd "Impostor/"
  grep -Po '(?<=\<VersionPrefix\>)[^\<]+' src/Directory.Build.props 
}
