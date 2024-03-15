# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=SteamTokenDumper
pkgname=${_pkgname,,}-git
pkgver=r213.1d231aa
pkgrel=1
pkgdesc='Steam token dumper for SteamDB'
arch=('x86_64' 'x86_64_v3')
url='https://steamdb.info/tokendumper/'
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('git' 'dotnet-sdk-8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip)
source=("git+https://github.com/SteamDatabase/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd ${_pkgname}
  # Remove potential old build artifacts
  rm -rf bin/ obj/
}

build() {
  cd ${_pkgname}

  # Follow steps of build.bat for Linux

  echo ':: PREPARING'
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  #_build_token=''  # Where do I get this?
  #mv ApiClient.cs ApiClient_build.cs.tmp
  #grep 'STEAMDB_BUILD_TOKEN' ApiClient_build.cs.tmp
  #sed -i "s/@STEAMDB_BUILD_TOKEN@/${_build_token}/g" ApiClient_build.cs.tmp

  echo ':: BUILDING LINUX'
  dotnet publish -c Release --runtime linux-x64 --self-contained true --output bin/SteamTokenDumper \
    /p:PublishSingleFile=true /p:PublishTrimmed=true /p:IncludeNativeLibrariesForSelfExtract=true \
    SteamTokenDumper.csproj
}

package(){
  cd ${_pkgname}

  install -Dm755 bin/SteamTokenDumper/SteamTokenDumper "${pkgdir}"/usr/bin/SteamTokenDumper
  install -Dm644 bin/SteamTokenDumper/SteamTokenDumper.config.ini "${pkgdir}"/usr/share/doc/${pkgname%-git}/SteamTokenDumper.config.ini
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname%-git}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}
